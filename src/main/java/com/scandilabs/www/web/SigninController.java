package com.scandilabs.www.web;

import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scandilabs.www.entity.User;
import com.scandilabs.www.service.MessageContext;
import com.scandilabs.www.service.SolrService;
import com.scandilabs.www.service.UserContext;


@Controller
@Scope("request")
public class SigninController {

    private Logger logger = LoggerFactory.getLogger(SigninController.class);

	@Autowired
	private UserContext userContext;
	
	@Autowired
	private MessageContext messageContext;
    
	@Autowired
    private SolrService solrService;
    
	@RequestMapping(value = "/signin", method = RequestMethod.GET)	
	public String logInGet(Map<String,Object> model) {
		messageContext.addPendingToModel(model);
		userContext.prepareModel(model);
		return "signin";
	}
    
	@RequestMapping(value = "/signin", method = RequestMethod.POST)	
	public String logInPost(HttpServletResponse response, Map<String,Object> model, @RequestParam("email") String email, @RequestParam("password") String password) {

		User user = solrService.findUserByEmail(email);
		if (user == null) {
			MessageContext.addToModel(model, "Invalid email", false);
			return "signin";
		}
		if (!user.passwordMatches(password)) {
			MessageContext.addToModel(model, "Invalid email or password", false);
			return "signin";
		}
		
		// Success
		userContext.setUserKey(user.getKey());
		Cookie cookie = new Cookie(UserContext.USERID_COOKIE_NAME, user.getKey());
		cookie.setMaxAge(2592000); // 30 days
		response.addCookie(cookie);
		
		return "redirect:/faqs";
	}
	
	@RequestMapping(value = "/signout", method = RequestMethod.GET)	
	public String logOut(HttpServletResponse response, Map<String,Object> model) {

		User user = userContext.getUser();
		userContext.setUserKey(null);
		Cookie cookie = new Cookie(UserContext.USERID_COOKIE_NAME, UserContext.LONG_TERM_USERID_COOKIE_REMOVED_VALUE);
		cookie.setMaxAge(2592000); // 30 days
		response.addCookie(cookie);
		messageContext.setMessage("Signed out " + user.getEmail(), true);
		return "redirect:/faqs";
	}

}
