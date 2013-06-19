package com.scandilabs.www.web;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.scandilabs.www.entity.Faq;
import com.scandilabs.www.entity.NestedTag;
import com.scandilabs.www.service.SolrService;
import com.scandilabs.www.service.UserContext;
import com.scandilabs.www.util.FaqUtils;


@Controller
@Scope("request")
public class LookupController {

    private Logger logger = LoggerFactory.getLogger(LookupController.class);

    @Autowired
    private SolrService solrService;
    
    @Autowired
	private UserContext userContext;        
    
    /**
     * 
     * @param nestedLevel the tag level to search for. 1 is top, 4 is bottom.
     * @param term to search for. May be null or empty string.
     * @param element1 conditional top-level tag value (i.e. if solr only has nested tag a|b|c|d this must be a or null or else nothing is returned)
     * @param element2
     * @param element3
     * @return
     */
    private ModelAndView nestedTagSearch(HttpServletRequest request, NestedTag parentTag, String partialTerm) {
    	
        ModelAndView mv = new ModelAndView("json-string");
        
        // Perform solr search        
        Set<Faq> faqs = solrService.searchByNestedTag(parentTag, partialTerm, userContext.getEffectiveContextId(request));
        
        // Build a uniqe list of category strings based on nested tags that match the term.
        // Note that solr search may return multiple tags per faq so we need to ignore tags that don't match
        Set<String> uniqueStrings = new HashSet<String>();
        for (Faq faq : faqs) {
        	for (int i = 0; i < faq.getNestedTags().length; i++) {
        		NestedTag matchCandidate = faq.getNestedTags()[i];
        		if (matchCandidate == null) {
        			continue;
        		}
        		
        		NestedTag candidateParentComparisonTag = null;
        		if (parentTag != null) {
        			candidateParentComparisonTag = matchCandidate.getTagAtLevel(parentTag.getNestedLevel());
        			if (candidateParentComparisonTag == null) {
        				
        				// Candidate is too shallow
        				continue;
        			} else {
        				if (!candidateParentComparisonTag.match(parentTag)) {
        					
        					// Parents are comparable but different
        					continue;
        				}
        			}
        		}
        		
        		String candidateString = null;
        		if (parentTag != null ) {
        			candidateString = matchCandidate.getElementAtLevel(parentTag.getNestedLevel()+1);
        		} else {
        			candidateString = matchCandidate.getFirstElement();
        		}
        		
        		if (candidateString == null) {
        			continue;
        		}
        		
        		// Does the faq result match the original term?
        		if (StringUtils.hasText(partialTerm)) {	        		
	    			if (!candidateString.startsWith(partialTerm)) {
	    				continue;
	    			}
        		}
        				
				// We have a match
				uniqueStrings.add(candidateString);
        	}
        }
        
        // Convert to a list and Sort alpha
        List<String> orderedStrings = new ArrayList(uniqueStrings);
        Collections.sort(orderedStrings);

        // Build results
        JSONArray json = new JSONArray();
        for (String name : orderedStrings) {
            json.add(name);
        }
        mv.addObject("json", json);
        return mv;
    }
    
    private ModelAndView emptyJSON() {
    	ModelAndView mv = new ModelAndView("json-string");
        JSONArray json = new JSONArray();
        mv.addObject("json", json);
        return mv;
    }
    
    @RequestMapping("/tags1.json")
    public ModelAndView tags1(HttpServletRequest request,
            @RequestParam(required = true) String term) throws Exception {

    	return nestedTagSearch(request, null, term);
    }    
    
    @RequestMapping("/tags2.json")
    public ModelAndView tags2(HttpServletRequest request,
            @RequestParam(required = true) String term, 
            @RequestParam(required = true) String tagX1) throws Exception {
    	
    	NestedTag parentTag = new NestedTag();
    	parentTag.addElement(tagX1);
    	return nestedTagSearch(request, parentTag, term);
    }    
    
    @RequestMapping("/tags3.json")
    public ModelAndView tags3(HttpServletRequest request,
            @RequestParam(required = true) String term, 
            @RequestParam(required = true) String tagX1, 
            @RequestParam(required = true) String tagX2) throws Exception {

    	NestedTag parentTag = new NestedTag();
    	parentTag.addElement(tagX1);
    	parentTag.addElement(tagX2);

    	return nestedTagSearch(request, parentTag, term);
    }    
    
    @RequestMapping("/tags4.json")
    public ModelAndView tags4(HttpServletRequest request,
            @RequestParam(required = true) String term, 
            @RequestParam(required = true) String tagX1,
            @RequestParam(required = true) String tagX2,
            @RequestParam(required = true) String tagX3) throws Exception {

    	NestedTag parentTag = new NestedTag();
    	parentTag.addElement(tagX1);
    	parentTag.addElement(tagX2);
    	parentTag.addElement(tagX3);

    	return nestedTagSearch(request, parentTag, term);
    }    
    
    @RequestMapping("/faq.json")
    public ModelAndView faq(HttpServletRequest request,
            @RequestParam(required = true) String key) throws Exception {

        ModelAndView mv = new ModelAndView("json-string");
        
        Faq faq = solrService.loadFaq(key);
        
        // Build results
        JSONObject json = JSONObject.fromObject(faq);
        mv.addObject("json", json);
        return mv;
    }
    
    @RequestMapping("/keywords.json")
    public ResponseEntity<String> keywords(HttpServletRequest request,
            @RequestParam(required = false) String query, @RequestParam(required = false) String canvas) throws UnsupportedEncodingException {

        // Logged in user?  If so show non-public FAQs
        String contextId = userContext.getEffectiveContextId(request);
        
        // Default to showing all faqs (TODO: paginate in the future)
        List<Faq> faqs = null;      
        if (query != null && StringUtils.hasText(query.trim()) && !query.equalsIgnoreCase("undefined")) {
        	faqs = solrService.searchFaq(query, contextId);	
        } else {
        	faqs = solrService.listFaqs(contextId);
        }        
        
        Set<String> keywords = FaqUtils.extractKeywords(faqs);
        
        JSONArray jsonArray = new JSONArray();
        for (String keyword : keywords) {
        	
        	// Compute a font size 
        	int size = this.computeFontSizeLarge(keyword);
        	if (StringUtils.hasText(canvas) && canvas.equalsIgnoreCase("small")) {
        		size = this.computeFontSizeSmall(keyword);
        	}        	
        	
        	JSONObject jsonObject = new JSONObject();
        	jsonObject.put("word",  keyword);
        	jsonObject.put("size", size);
        	jsonArray.add(jsonObject);
        }
        
        HttpHeaders responseHeaders = new HttpHeaders();
        responseHeaders.set("Access-Control-Allow-Origin", "*");
        return new ResponseEntity<String>(jsonArray.toString(2), responseHeaders, HttpStatus.CREATED);        
    }
    
    /**
     * Compute a font size based on word length range from min 2 to max 8
     * @param keyword
     * @return
     */
    private int computeFontSizeLarge(String keyword) {
    	int size = 2; // default
    	
    	if (keyword.length() < 4) {
    		size = 8;
    	} else if (keyword.length() < 6) {
    		size = 7;
    	} else if (keyword.length() < 9) {
    		size = 6;
    	} else if (keyword.length() < 11) {
    		size = 5;
    	} else if (keyword.length() < 16) {
    		size = 4;
    	} else if (keyword.length() < 22) {
    		size = 3;
    	}
    	
    	return size;
    }
    
    /**
     * Compute a font size based on word length range from min 1 to max 3
     * @param keyword
     * @return
     */
    private int computeFontSizeSmall(String keyword) {
    	int size = 1; // default
    	
    	if (keyword.length() < 4) {
    		size = 3;
    	} else if (keyword.length() < 6) {
    		size = 3;
    	} else if (keyword.length() < 9) {
    		size = 2;
    	} else if (keyword.length() < 11) {
    		size = 2;
    	} else if (keyword.length() < 16) {
    		size = 1;
    	} else if (keyword.length() < 22) {
    		size = 1;
    	}
    	
    	return size;
    }   
    
    @RequestMapping("/something")
    public ResponseEntity<String> handle(HttpEntity<byte[]> requestEntity) throws UnsupportedEncodingException {
      String requestHeader = requestEntity.getHeaders().getFirst("MyRequestHeader");
      byte[] requestBody = requestEntity.getBody();
      // do something with request header and body

      HttpHeaders responseHeaders = new HttpHeaders();
      responseHeaders.set("MyResponseHeader", "MyValue");
      return new ResponseEntity<String>("Hello World", responseHeaders, HttpStatus.CREATED);
    }

}
