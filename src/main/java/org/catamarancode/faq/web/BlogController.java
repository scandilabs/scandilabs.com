package org.catamarancode.faq.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bican.wordpress.Page;
import net.bican.wordpress.Wordpress;

import org.catamarancode.faq.service.MessageContext;
import org.catamarancode.faq.service.SolrService;
import org.catamarancode.faq.service.UserContext;
import org.catamarancode.faq.util.StringLineBreakToParagraphConverter;
import org.catamarancode.util.LRUCache;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@Scope("request")
public class BlogController {

	private Logger logger = LoggerFactory.getLogger(BlogController.class);

	// Live 24hrs
	// Note pageCache is static because of @Scope("request") annotation.  Without that annotation the controller would be a singleton so it would not have to be static. 
	private static LRUCache<String, List<Page>> pageCache = new LRUCache<String, List<Page>>(200, 86400000);
	
	@Autowired
	private SolrService solrService;

	@Autowired
	private MessageContext messageContext;

	@Autowired
	private UserContext userContext;
	
	private Wordpress getWordpressClient() throws Exception {
		// Note that www.scandilabs.com DNS is set statically on uprod. for some reason the DNS lookup fails..
		Wordpress wp = new Wordpress("sladmin", "scandi12",
				"http://www.scandilabs.com/blog/xmlrpc.php");
		return wp;
	}
	
	private List<Page> getRecentPostsCached(int number) throws Exception {
		Wordpress wp = getWordpressClient();
		String cacheKey = "recent" + number;
		List<Page> recentPosts = pageCache.get(cacheKey);
		if (recentPosts == null) {
			logger.debug("blog cache miss on " + cacheKey);
			recentPosts = wp.getRecentPosts(number);
			pageCache.put(cacheKey, recentPosts);
		} else {
			logger.debug("blog cache hit on " + cacheKey);
		}
		
		return recentPosts;
	}
	
	private Page getPostCached(int id) throws Exception {
		Wordpress wp = getWordpressClient();
		String cacheKey = "id" + id;
		List<Page> recentPosts = pageCache.get(cacheKey);
		if (recentPosts == null) {
			logger.debug("blog cache miss on " + cacheKey);
			Page post = wp.getPost(id);
			if (post != null) {
				recentPosts = new ArrayList<Page>();
				recentPosts.add(post);
				pageCache.put(cacheKey, recentPosts);				
			}
		} else {
			logger.debug("blog cache hit on " + cacheKey);
		}
		if (recentPosts != null) {
			return recentPosts.get(0);
		} else {
			return null;
		}		
	}
	
	@RequestMapping("/blog-clear-cache")
	public void blogClearCache(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		pageCache = new LRUCache<String, List<Page>>(200, 86400000);
		
	}

	@RequestMapping("/blog")
	public ModelAndView blog(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<Page> recentPosts = getRecentPostsCached(10);

		ModelAndView mv = new ModelAndView();
		mv.addObject("posts", recentPosts);
		userContext.prepareModel(mv.getModel());
		messageContext.addPendingToModel(mv.getModel());
		
		// Workaround for missing <p> tags
		Map<String, Page> postsById = new HashMap<String, Page>();		
		StringLineBreakToParagraphConverter converter = new StringLineBreakToParagraphConverter();
		List<String> postIdList = new ArrayList<String>();
		Map<String, String> paragraphedDescriptions = new HashMap<String, String>();
		for (Page page : recentPosts) {
			String idStr = String.valueOf(page.getPostid());
			postIdList.add(idStr);
			paragraphedDescriptions.put(idStr, converter.process(page.getDescription()));
			postsById.put(idStr, page);
		}
		mv.addObject("paragraphedDescriptions", paragraphedDescriptions);
		mv.addObject("postIds", postIdList);
		mv.addObject("postsById", postsById);

		return mv;
	}
	
	@RequestMapping("/blog-post")
	public ModelAndView blogPost(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int id = Integer.parseInt(request.getParameter("id"));

		Page post = this.getPostCached(id);		

		ModelAndView mv = new ModelAndView();
		mv.addObject("post", post);
		userContext.prepareModel(mv.getModel());
		messageContext.addPendingToModel(mv.getModel());
		
		// Workaround for missing <p> tags
		StringLineBreakToParagraphConverter converter = new StringLineBreakToParagraphConverter();
		mv.addObject("paragraphedDescription", converter.process(post.getDescription()));


		return mv;
	}

}
