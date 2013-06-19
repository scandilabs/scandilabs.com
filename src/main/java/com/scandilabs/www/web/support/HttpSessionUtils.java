package com.scandilabs.www.web.support;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


import com.scandilabs.www.entity.User;
import com.scandilabs.www.service.SolrService;


public class HttpSessionUtils {

    private HttpSessionUtils() {
    }

    public static final String SESSION_ATTRIBUTE_USER_ID = "userId";
    public static final String SESSION_ATTRIBUTE_TARGET_PATH = "targetPath";
    public static final String LOGGED_IN_USER = "loggedInUser";

    public static void removeLoggedInUser(HttpServletRequest request) {
        request.getSession().setAttribute(SESSION_ATTRIBUTE_USER_ID, null);
    }
    
    private static void storeKeyValue(HttpServletRequest request, String key, Object value) {
        request.getSession().setAttribute(key, value);
    }
    
    private static Object loadKeyValue(HttpServletRequest request, String key) {
        return request.getSession().getAttribute(key);
    }
    
    private static void removeKeyValue(HttpServletRequest request, String key) {
        storeKeyValue(request, key, null);
    }
    
    /**
     * Used during login as a workaround for frequent timeout bug
     * @param request
     */
    public static void invalidateExistingSession(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
    }
    
    public static void storeLoggedInUser(HttpServletRequest request, User user) {
        request.getSession().setAttribute(SESSION_ATTRIBUTE_USER_ID, user.getKey());
    }
    
    public static boolean isUserLoggedIn(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }
        String userId = (String) session.getAttribute(
                SESSION_ATTRIBUTE_USER_ID);
        if (userId == null) {
            return false;
        }
        return true;
    }
    
    public static String retrieveLoggedInUserId(HttpServletRequest request) {
        String userId = (String) request.getSession().getAttribute(
                SESSION_ATTRIBUTE_USER_ID);
        /*
        if (userId == null) {
            throw new RuntimeException(
                    "Logged in user not found in http session.");
        }
        */
        return userId;
    }
    
    public static User retrieveLoggedInUser(HttpServletRequest request, SolrService solrService) {
        String userId = retrieveLoggedInUserId(request);
        if (userId == null) {
            return null;
        }
        User user = solrService.loadUser(userId);
        return user;
    }
    


}
