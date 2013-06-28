package com.scandilabs.www.web;

import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.RandomStringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scandilabs.www.entity.Audit;
import com.scandilabs.www.entity.Comment;
import com.scandilabs.www.entity.Faq;
import com.scandilabs.www.entity.NestedTag;
import com.scandilabs.www.service.MessageContext;
import com.scandilabs.www.service.SolrService;
import com.scandilabs.www.service.UserContext;
import com.scandilabs.www.service.support.Visibility;


@Controller
@Scope("request")
public class UserController {

    private Logger logger = LoggerFactory.getLogger(UserController.class);

    @Autowired
    private SolrService solrService;
    
    @Autowired
	private UserContext userContext;        

    @Autowired
	private MessageContext messageContext;   
    
	@RequestMapping(value = "/technology/knowledge/entry-edit", method = RequestMethod.GET)	
	public String faqEditGet(Map<String,Object> model, @RequestParam(value="key", required=false) String faqId, HttpServletRequest request) {

		messageContext.addPendingToModel(model);
		if (!userContext.isLoggedIn(request)) {
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);
		
        Faq faq = solrService.loadFaq(faqId);
        model.put("faq", faq);
        return "technology/knowledge/entry-edit";		
	}
    
    @RequestMapping(value = "/technology/knowledge/entry-edit", method = RequestMethod.POST)
    public String faqEditPost(Map<String,Object> model, HttpServletRequest request) throws Exception {
    	
    	if (!userContext.isLoggedIn(request)) {
    		return "redirect:/signin";
    	}
    	userContext.prepareModel(model);    	

        String faqId = request.getParameter("key");
        String question = request.getParameter("question");
        String answer = request.getParameter("answer");
        
        Faq faq = null;
        boolean update = false;
        if (StringUtils.hasText(faqId)) {
            faq = solrService.loadFaq(faqId);            
            update = true;
        } else {
            faq = new Faq();
            faq.setContextId(userContext.getEffectiveContextId(request));
            faq.setCreatedTime(new Date());
            
            // Default to CONTEXT (your organization or topical group) visibility
            faq.setVisibility(Visibility.CONTEXT);
        }            
        faq.setQuestion(question);
        faq.setAnswer(answer);
        faq.setLastModifiedTime(new Date());

        // Change owner to last editor.
        faq.setOwnerKey(userContext.getUserKey());
        faq.setOwnerName(userContext.getUser().getName());        

        // tags
        boolean hasTags = false;
        for (int i=0; i < faq.getNestedTags().length; i++) {
        	NestedTag currentTag = null;
        	for (int j=0; j < 4; j++) {
        		String tagName = "tag" + (i+1) + (j+1);
        		String value = request.getParameter(tagName);
        		boolean hasValue = StringUtils.hasText(value);
        		if (hasValue) {
        			hasTags = true;
        		}
        		
        		// Overwrite an existing tag?
        		if (j == 0) {
        			currentTag = new NestedTag();
        			faq.getNestedTags()[i] = currentTag;
        		}
        		
        		if (hasValue && currentTag != null) {
        			
        			// Make sure parent tag is not empty before adding child elements
        			if (j == 0 || (j > 0 && !currentTag.getElements().isEmpty())) {
        				currentTag.addElement(value);	
        			}        			
        		} 
        	}
        }
        
        if (!hasTags) {
        	throw new IllegalArgumentException("At least one Topic must be entered");
        }

        // Save
        this.solrService.save(faq);
        
        // Create audit entry
        Audit audit = new Audit();
        if (update) {
        	audit.setBody("Updated FAQ");
        } else {
        	audit.setBody("Created FAQ");
        }
        audit.setKey(RandomStringUtils.randomAlphanumeric(16));
        audit.setFaqForeignKey(faq.getKey());
        audit.setOwnerKey(userContext.getUserKey());
        audit.setOwnerName(userContext.getUser().getName());
        audit.setContextId(userContext.getEffectiveContextId(request));
        audit.setLastModifiedTime(new Date());
        audit.setCreatedTime(new Date());
        this.solrService.save(audit);
        
        return "redirect:/technology/knowledge/entry?key=" + faq.getKey();
    }
    
	@RequestMapping(value = "/technology/knowledge/comment-edit", method = RequestMethod.GET)	
	public String commentEditGet(Map<String,Object> model, @RequestParam(value="key", required=false) String key, HttpServletRequest request) {

		messageContext.addPendingToModel(model);
		if (!userContext.isLoggedIn(request)) {
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);
		
        Comment comment = solrService.loadComment(key, userContext.getEffectiveContextId(request));
        model.put("comment", comment);
        return "technology/knowledge/comment-edit";		
	}
    
    @RequestMapping(value = "/technology/knowledge/comment-edit", method = RequestMethod.POST)
    public String commentEditPost(Map<String,Object> model, HttpServletRequest request) throws Exception {
    	
    	if (!userContext.isLoggedIn(request)) {
    		return "redirect:/signin";
    	}
    	userContext.prepareModel(model);    	

    	String faqKey = request.getParameter("faqKey");
    	if (!StringUtils.hasText(faqKey)) {
    		throw new IllegalArgumentException("Missing faqKey");
    	}
        String key = request.getParameter("key");
        String body = request.getParameter("body");

        Comment comment = null;
        boolean update = false;
        if (StringUtils.hasText(key)) {
            comment = solrService.loadComment(key, userContext.getEffectiveContextId(request));            
            update = true;
        } else {
        	comment = new Comment();
        	comment.setKey(RandomStringUtils.randomAlphanumeric(16));
        	comment.setContextId(userContext.getEffectiveContextId(request));
        	comment.setCreatedTime(new Date());
            comment.setFaqForeignKey(faqKey);
        }            
        comment.setBody(body);
        comment.setLastModifiedTime(new Date());

        // Change owner to last editor.
        comment.setOwnerKey(userContext.getUserKey());
        comment.setOwnerName(userContext.getUser().getName());        

        // Save
        this.solrService.save(comment);
        
        // Create audit entry
        Audit audit = new Audit();
        if (update) {
        	audit.setBody("Updated Comment");
        } else {
        	audit.setBody("Created Comment");
        }
        audit.setKey(RandomStringUtils.randomAlphanumeric(16));
        audit.setFaqForeignKey(faqKey);
        audit.setOwnerKey(userContext.getUserKey());
        audit.setOwnerName(userContext.getUser().getName());
        audit.setContextId(userContext.getEffectiveContextId(request));
        audit.setLastModifiedTime(new Date());
        audit.setCreatedTime(new Date());
        this.solrService.save(audit);
        
        return "redirect:/technology/knowledge/entry?key=" + faqKey;
    }    

}
