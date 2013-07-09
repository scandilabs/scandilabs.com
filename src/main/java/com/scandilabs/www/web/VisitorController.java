package com.scandilabs.www.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.StringWriter;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.solr.client.solrj.response.QueryResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.scandilabs.www.entity.Audit;
import com.scandilabs.www.entity.Comment;
import com.scandilabs.www.entity.Faq;
import com.scandilabs.www.entity.NestedTag;
import com.scandilabs.www.service.ApplicationConfiguration;
import com.scandilabs.www.service.MessageContext;
import com.scandilabs.www.service.SolrService;
import com.scandilabs.www.service.UserContext;
import com.scandilabs.www.util.CatamaranMarkdown;
import com.scandilabs.www.util.FaqUtils;
import com.scandilabs.www.web.support.NestedTagNode;


@Controller
@Scope("request")
public class VisitorController {

    private Logger logger = LoggerFactory.getLogger(VisitorController.class);

    @Autowired
    private SolrService solrService;
    
    @Autowired
	private MessageContext messageContext;    

    @Autowired
	private ApplicationConfiguration applicationConfiguration;    

    @Autowired
	private UserContext userContext;        

    @RequestMapping("/technology/knowledge")
    public ModelAndView technologyKnowledgeIndex(HttpServletRequest request,
            HttpServletResponse response) {

        // Get parameters
        String query = request.getParameter("query");
        
        // A topic (tag) search?
        String tagFilter = null;
        if (StringUtils.hasText(query) && query.toLowerCase().indexOf("topic:") > -1) {
        	tagFilter = query.toLowerCase().replace("topic:", "").trim();
        	if (tagFilter.indexOf(":") > -1) {
        		tagFilter = tagFilter.replace(":", "|");
        	}
        }
        
        // Logged in user?  If so show non-public FAQs
        String contextId = userContext.getEffectiveContextId(request);
        
        // Find faqs filtered by parameters
        List<Faq> faqs = null;
        NestedTag tagParam = null;
        if (StringUtils.hasText(tagFilter)) {
        	tagParam = NestedTag.createFromPipeSeparatedString(tagFilter);
            faqs = new ArrayList<Faq>(solrService.findByTag(tagParam, true, contextId));
        } else if (StringUtils.hasText(query)) {
        	
        	// Strip out characters we don't want in query
        	String filteredQuery = query.replace(":", " ");
            QueryResponse queryResponse = solrService.search(filteredQuery + " AND document-type:FAQ", contextId);
            faqs = solrService.extractFaqs(queryResponse);    
        } else {
            
            // Default to showing all faqs (TODO: paginate in the future)
            faqs = solrService.listFaqs(contextId);    
        }
        
        ModelAndView mv = new ModelAndView("technology/knowledge/index");
        userContext.prepareModel(mv.getModel());
        messageContext.addPendingToModel(mv.getModel());
        
        // Group faqs by category
        // NOTE: We limit ourselves to 4 levels deep (to avoid headache of recursion)
        NestedTagNode top = new NestedTagNode(null);
        for (Faq faq : faqs) {
        	for (int i = 0; i < faq.getNestedTags().length; i++) {
	            NestedTag tag = faq.getNestedTags()[i];
	            NestedTagNode currentNode = null;
	            if (tag != null) {
	            	
	            	// If tag parameter is specified, skip nodes that don't match
	            	if (tagParam != null) {
	            		if (!tag.match(tagParam, true)) {
	            			continue;
	            		}
	            	}
	            	
	                for (int j = 0; j < tag.getElements().size(); j++) {
	                    if (j == 0) {
	                        currentNode = top;                    
	                    }
	                    currentNode = currentNode.getOrCreateChild(tag.getElements().get(j));                
	                }
	                
	                // Add the FAQ itself
	                currentNode.addFaq(faq);
	            }
        	}
        }
        
        // Create keyword list from tags and categories
        Set<String> keywords = FaqUtils.extractKeywords(faqs);
        mv.addObject("keywords", keywords);

        mv.addObject("top", top);
        return mv;
    }
  
	@RequestMapping("/technology/knowledge/{entryKey}")
	public ModelAndView entry(@PathVariable("entryKey") String entryKey, HttpServletRequest request,
			HttpServletResponse response) {

        ModelAndView mv = new ModelAndView("technology/knowledge/entry");
        messageContext.addPendingToModel(mv.getModel());
        userContext.prepareModel(mv.getModel());
        String contextId = userContext.getEffectiveContextId(request);
        
        // One specific faq?
        String faqId = entryKey;        
        Faq faq = solrService.loadFaq(faqId);
        if (faq == null) {
        	messageContext.setMessage("Invalid FAQ url. Please search again.", false);
            return new ModelAndView("redirect:/technology/knowledge");
        }
        
        // Audits and comments
        List<Audit> audits = solrService.listAudits(faq);
        mv.addObject("audits",  audits);
        List<Comment> comments = solrService.listComments(faq);
        mv.addObject("comments", comments);
        
        // Create keyword list from tags and categories
        List<Faq> faqs = new ArrayList<Faq>();
        faqs.add(faq);
        Set<String> keywords = FaqUtils.extractKeywords(faqs);
        mv.addObject("keywords", keywords);
        
        // Nothing
        mv.addObject("faq", faq);
        return mv;
    }
    
    @RequestMapping("/")
    public ModelAndView home(HttpServletRequest request,
            HttpServletResponse response) {
    	return index(request, response);
    }
    
    @RequestMapping("/index")
    public ModelAndView index(HttpServletRequest request,
            HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("index");
        userContext.prepareModel(mv.getModel());
        return mv;    	
    }

    
    @RequestMapping("/technology")
    public ModelAndView technology(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView("technology/index");
        userContext.prepareModel(mv.getModel());
        return mv;
    }  
    
    @RequestMapping("/services")
    public ModelAndView services(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }    
    
    @RequestMapping("/careers")
    public ModelAndView careers(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView("careers/index");
        userContext.prepareModel(mv.getModel());
        return mv;
    }      
    

    @RequestMapping("/careers/*")
    public ModelAndView careersJobs(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }       

    @RequestMapping("/contact")
    public ModelAndView contact(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        messageContext.addPendingToModel(mv.getModel());
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/clients")
    public ModelAndView clients(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        ModelAndView mv = new ModelAndView("clients/index");
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/clients/inspector-time")
    public ModelAndView clientsInspectorTime(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/clients/medventive")
    public ModelAndView clientsMedventive(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/clients/postpost")
    public ModelAndView clientsPostpost(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/clients/snagajob")
    public ModelAndView clientsSnagajob(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/clients/travelclick")
    public ModelAndView clientsTravelclick(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }    
    
    @RequestMapping("/about")
    public ModelAndView about(HttpServletRequest request,
            HttpServletResponse response) {
        ModelAndView mv = new ModelAndView("about/index");
        userContext.prepareModel(mv.getModel());
        return mv;
    }    

    @RequestMapping("/about/management")
    public ModelAndView aboutManagement(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }        

    @RequestMapping("/about/partners")
    public ModelAndView aboutPartners(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }        

    @RequestMapping("/technology/catamaran/tutorial")
    public ModelAndView technologyCatamaranTutorial(HttpServletRequest request,
            HttpServletResponse response) throws Exception {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        
        // We maintain page contents as markdown for easy editing/formatting
        
        // Check for external tutorial file override
        BufferedReader b = null;
        if (applicationConfiguration != null && applicationConfiguration.getTutorialFileOverridePath() != null && applicationConfiguration.getTutorialFileOverridePath().length() > 2) {
        	
        	// Load tutorial file
        	URL loadedResource = this.getClass().getClassLoader().getResource("tutorial.md");
            File file = new File(applicationConfiguration.getTutorialFileOverridePath());
            b = new BufferedReader(new FileReader(file));
        } else {
        	
        	// Load from classpath by default
        	URL loadedResource = this.getClass().getClassLoader().getResource("tutorial.md");
            b = new BufferedReader(new FileReader(loadedResource.getFile()));	
        }
        
    	StringWriter w = new StringWriter();
    	String line = null;
		boolean indent = false;
		while ((line = b.readLine()) != null) {
			w.write(line);
			w.write("\r\n");
		}
    	
    	String s = w.toString();    	
    	CatamaranMarkdown m = new CatamaranMarkdown(); 
    	mv.addObject("htmlContent", m.markdown(s));
        
        return mv;
    }

    @RequestMapping("/reference")
    public ModelAndView reference(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }

    @RequestMapping("/technology/catamaran/source")
    public ModelAndView technologyCatamaranSource(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }

    @RequestMapping("/technology/catamaran/download")
    public ModelAndView technologyCatamaranDownload(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }

    @RequestMapping("/technology/catamaran/questions")
    public ModelAndView technologyCatamaranQuestions(HttpServletRequest request,
            HttpServletResponse response) {

        ModelAndView mv = new ModelAndView();
        userContext.prepareModel(mv.getModel());
        return mv;
    }

}
