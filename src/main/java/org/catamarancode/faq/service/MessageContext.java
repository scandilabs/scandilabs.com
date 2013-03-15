package org.catamarancode.faq.service;

import java.io.Serializable;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;

/**
 * A bean that represents a wrapper around a user message object stored in a session
 * @author mkvalsvik
 *
 */
@Component
@Scope("session")
public class MessageContext implements Serializable {

	private static final long serialVersionUID = 1L;
	public static final String MESSAGE_MODEL_KEY = "message";
	public static final String MESSAGE_SUCCESS_MODEL_KEY = "messageSuccess";
	
	private String message;
	private boolean success;
	private boolean expired;
	
	public void setMessage(String message, boolean success) {
		this.message = message;
		this.success = success;
		this.expired = false;
	}
	
    public void addPendingToModel(Map<String, Object> model) {
    	if (!this.expired) {
    		addToModel(model, this.message, this.success);	
    	}    	
    	this.expired = true;
    }
    
    public static void addToModel(Map<String, Object> model,
            String message, boolean success) {
    	if (message != null) {
    		model.put(MESSAGE_MODEL_KEY, message);
    		model.put(MESSAGE_SUCCESS_MODEL_KEY, success);
    	}
    }


}
