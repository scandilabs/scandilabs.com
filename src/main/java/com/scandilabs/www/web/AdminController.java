package com.scandilabs.www.web;

import java.util.Date;
import java.util.List;
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
import com.scandilabs.www.entity.Faq;
import com.scandilabs.www.entity.User;
import com.scandilabs.www.service.MessageContext;
import com.scandilabs.www.service.SolrService;
import com.scandilabs.www.service.UserContext;
import com.scandilabs.www.service.support.Visibility;


@Controller
@Scope("request")
public class AdminController {

    private Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    private SolrService solrService;

    @Autowired
	private MessageContext messageContext;

    @Autowired
	private UserContext userContext;        
    
    @RequestMapping(value = "/technology/knowledge//entry-publicize", method = RequestMethod.GET)	
	public String faqPublicize(Map<String,Object> model, HttpServletRequest request) {
    	
		if (!userContext.isLoggedInAdministrator(request)) {
			messageContext.setMessage("Only Administrator can do that.", false);
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);

		String faqId = request.getParameter("key");        
        Faq faq = solrService.loadFaq(faqId);
        if (faq == null) {
        	messageContext.setMessage("FAQ key not found", false);        	
        	return "redirect:/technology/knowledge/entry?key=" + faqId;
        }

        faq.setVisibility(Visibility.PUBLIC);
        solrService.save(faq);
        messageContext.setMessage("Publicized FAQ successfully", true);
        return "redirect:/technology/knowledge/entry?key=" + faqId;
	}

    
    @RequestMapping(value = "/technology/knowledge/create-initial-admin-user", method = RequestMethod.GET)	
	public String createInitialAdminUser(Map<String,Object> model, HttpServletRequest request) {
    	
    	User existingUser = this.solrService.loadUser("adminUserKey");
    	if (existingUser != null) {
        	messageContext.setMessage("Admin user has already been created", true);
        	return "redirect:/signin";
    	}
    	
    	User user = new User();
    	user.setKey("adminUserKey");
    	user.getName().setFirst("Mads");
    	user.getName().setLast("Kvalsvik");
    	user.setCleartextPassword("password");
    	user.setCreatedTime(new Date());
    	user.setLastModifiedTime(new Date());
    	user.setAdministrator(true);
    	user.setEmail("mkvalsvik@scandilabs.com");
    	this.solrService.save(user);
    	messageContext.setMessage("Created initial admin user", true);
    	return "redirect:/signin";
    }
    
	@RequestMapping(value = "/technology/knowledge/users", method = RequestMethod.GET)	
	public String users(Map<String,Object> model, HttpServletRequest request) {

		if (!userContext.isLoggedInAdministrator(request)) {
			messageContext.setMessage("Only Administrator can do that.", false);
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);
		
		messageContext.addPendingToModel(model);
		
		List<User> users = solrService.listUsers();
		model.put("users", users);
		
		return "technology/knowledge/users";
	}

	@RequestMapping(value = "/technology/knowledge/audits", method = RequestMethod.GET)	
	public String audits(Map<String,Object> model, HttpServletRequest request) {

		if (!userContext.isLoggedInAdministrator(request)) {
			messageContext.setMessage("Only Administrator can do that.", false);
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);
		
		messageContext.addPendingToModel(model);
		
		List<Audit> audits = solrService.listAudits(userContext.getEffectiveContextId(request));
		model.put("audits", audits);
		
		return "technology/knowledge/audits";
	}
	
	
	@RequestMapping(value = "/technology/knowledge/user", method = RequestMethod.GET)	
	public String user(Map<String,Object> model, @RequestParam("key") String key, HttpServletRequest request) {

		messageContext.addPendingToModel(model);
		if (!userContext.isLoggedInAdministrator(request)) {
			messageContext.setMessage("Only Administrator can do that.", false);
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);

		// Load and show user given by key param
		User displayUser = this.solrService.loadUser(key);
		model.put("displayUser", displayUser);
		
		return "technology/knowledge/user";
	}	
	
	@RequestMapping(value = "/technology/knowledge/user-edit", method = RequestMethod.GET)	
	public String userEditGet(Map<String,Object> model, @RequestParam(value="key", required=false) String key, HttpServletRequest request) {

		messageContext.addPendingToModel(model);
		if (!userContext.isLoggedInAdministrator(request)) {
			messageContext.setMessage("Only Administrator can do that.", false);
    		return "redirect:/signin";
    	}
		userContext.prepareModel(model);

		// Load and show user given by key param
		User displayUser = this.solrService.loadUser(key);
		model.put("displayUser", displayUser);
		
		return "technology/knowledge/user-edit";
	}
    
	@RequestMapping(value = "/technology/knowledge/user-edit", method = RequestMethod.POST)	
	public String userEditPost(HttpServletRequest request, Map<String,Object> model, @RequestParam("administratorFlag") boolean administratorFlag, @RequestParam(value="key", required=false) String key, @RequestParam("firstName") String firstName, @RequestParam("lastName") String lastName, @RequestParam("email") String email, @RequestParam("password") String password) {

		if (!userContext.isLoggedInAdministrator(request)) {
			messageContext.setMessage("Only Administrator can do that.", false);
    		return "redirect:/signin";
    	}

		User user = null;
		if (StringUtils.hasText(key)) {
			user = this.solrService.loadUser(key);
		} else {
			user = new User();
			user.setKey(RandomStringUtils.randomAlphanumeric(10));
			user.setCreatedTime(new Date());
		}
		
		user.getName().setFirst(firstName);
		user.getName().setLast(lastName);
		user.setEmail(email);
		user.setAdministrator(administratorFlag);
		if (!password.startsWith("*")) {
			user.setCleartextPassword(password);	
		}		
		user.setLastModifiedTime(new Date());
        
        this.solrService.save(user);
        
        return "redirect:/technology/knowledge/users";
    }    
    
}
