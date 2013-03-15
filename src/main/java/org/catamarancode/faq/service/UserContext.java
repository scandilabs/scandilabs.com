package org.catamarancode.faq.service;

import java.io.Serializable;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.catamarancode.faq.entity.User;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * A bean that represents a wrapper around a User object stored in a session
 * @author mkvalsvik
 *
 */
@Component
@Scope("session")
public class UserContext implements Serializable {
	
    private static SolrService solrService;
	
	private static final String USER_MODEL_KEY = "user";
	public static final String LONG_TERM_USERID_COOKIE_REMOVED_VALUE = "cookie_value_removed";

	private static final long serialVersionUID = 1L;
	
	private Logger logger = LoggerFactory.getLogger(UserContext.class);	
	
	/**
	 * Workaround for unexpected session termination
	 * Must be set by login controller
	 * TODO: Make this more secure!!
	 */
	public static final String USERID_COOKIE_NAME = "CATAMARANUSERID";
	
	private String userKey;
	
	public void prepareModel(Map<String, Object> model) {
		User user = this.getUser();
		model.put(USER_MODEL_KEY, user);
	}
	
	public User getUser() {
		User user = solrService.loadUser(this.getUserKey());
		return user;
	}
	
	/**
	 * Returns the context id that is in effect for current user (or visitor if not logged in)
	 * @return
	 */
	public String getEffectiveContextId(HttpServletRequest request) {
        String contextId = SolrService.CONTEXT_ID_PUBLIC;
    	if (this.isLoggedIn(request)) {
    		User user = this.getUser();
    		if (user != null) {
    			contextId = this.getUser().getContextId();	
    		}    		
    	}
    	return contextId;
	}

	public String getUserKey() {
		return userKey;
	}

	public void setUserKey(String userId) {
		this.userKey = userId;
	}
	
	/**
	 * TODO: Taking HttpServletRequest is a workaround for unexpected session termination issues
	 * @return
	 */
	public boolean isLoggedIn(HttpServletRequest request) {
		
		// Workaround:  Check cookie if nothing in session
		if (this.userKey == null) {	
			String cookieUserId = getCookieValue(USERID_COOKIE_NAME, request);
			if (cookieUserId != null && !cookieUserId.equals(LONG_TERM_USERID_COOKIE_REMOVED_VALUE)) {
				userKey = cookieUserId;					
					
				// Debug logging only
				String jSessionId = getCookieValue("JSESSIONID", request);
				if (jSessionId != null) {
					logger.debug(String.format("Workaround: Cookie JSESSIONID %s did not match HttpSession id %s but retained user logged in state via cookie %s with value %s", jSessionId, request.getSession().getId(), USERID_COOKIE_NAME, userKey));
				} else {
					logger.debug(String.format("Workaround: Cookie JSESSIONID not found but retained user logged in state via cookie %s with value %s", USERID_COOKIE_NAME, userKey));
				}					
			}			
		}
		
		if (this.userKey != null) {
			return true;
		}
		return false;
	}
	
	public boolean isLoggedInAdministrator(HttpServletRequest request) {
		if (!this.isLoggedIn(request)) {
			return false;
		}
		
		return this.getUser().isAdministrator();
	}	
	
	private String getCookieValue(String name, HttpServletRequest request) {
		if (request.getCookies() == null) {
			return null;
		}
		for (int j = 0; j < request.getCookies().length; j++) {
			Cookie c = request.getCookies()[j];
			if (c.getName().equals(name)) {
				return c.getValue();
			}
		}
		return null;
	}

	public static void setSolrService(SolrService solrService) {
		UserContext.solrService = solrService;
	}

}
