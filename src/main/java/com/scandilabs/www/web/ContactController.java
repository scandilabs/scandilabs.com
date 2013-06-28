package com.scandilabs.www.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.scandilabs.catamaran.mail.send.SimpleHtmlMailSender;
import com.scandilabs.www.service.ApplicationConfiguration;
import com.scandilabs.www.service.MessageContext;
import com.scandilabs.www.service.UserContext;


@Controller
@Scope("request")
public class ContactController {

    private Logger logger = LoggerFactory.getLogger(ContactController.class);

    @Autowired
	private MessageContext messageContext;    

    @Autowired
	private ApplicationConfiguration applicationConfiguration;    
    
    @Autowired
    private SimpleHtmlMailSender mailSender;

    @Autowired
	private UserContext userContext;        

	@RequestMapping(value = "/contact-send", method = RequestMethod.POST)	
	public String userEditPost(HttpServletRequest request, Map<String,Object> model, @RequestParam(value="name", required=true) String name, @RequestParam("customer_mail") String email, @RequestParam("subject") String subject, @RequestParam("detail") String detail) {

		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo("mkvalsvik@scandilabs.com");
		message.setSubject("scandilabs.com contact request from " + name);
		message.setText(name + " (" + email + "), subject: " + subject + ", body: " + detail);
        
		mailSender.send(message);        
        messageContext.setMessage("Thank you, we will be in touch", true);
        return "redirect:/contact";
    }    

}
