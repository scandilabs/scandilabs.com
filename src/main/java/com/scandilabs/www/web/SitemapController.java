package com.scandilabs.www.web;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.bican.wordpress.Page;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.scandilabs.catamaran.util.LRUCache;
import com.scandilabs.www.entity.Faq;
import com.scandilabs.www.service.ApplicationConfiguration;
import com.scandilabs.www.service.SolrService;

@Controller
@Scope("request")
public class SitemapController {

	private Logger logger = LoggerFactory.getLogger(SitemapController.class);

	@Autowired
	private ApplicationConfiguration applicationConfiguration;
	
	@Autowired
    private SolrService solrService;

	@Autowired
	private RequestMappingHandlerMapping requestMappingHandlerMapping;

	@RequestMapping(value = "/sitemap.txt", method = RequestMethod.GET)
	public void siteMapTxt(HttpServletRequest request,
			HttpServletResponse response) throws IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter writer = response.getWriter();

		// Start with static links
		Resource resource = new ClassPathResource("staticSitemap.txt");
		BufferedReader reader = new BufferedReader(new InputStreamReader(resource.getInputStream()));		
		String line = reader.readLine();
		while (line != null) {
			writer.write(line);
			writer.write("\n");
			line = reader.readLine();
		}
		
		// Generate blog post links
		LRUCache<String, List<Page>> pageCache = BlogController.getPageCache();
		Set<String> links = new HashSet<String>();
		for (String key : BlogController.getKeyCache()) {			
			for (Page page : pageCache.get(key)) {
				writer.write("http://scandilabs.com/blog/");
				writer.write(page.getWp_slug());
				writer.write("\n");
			}
		}
		
		// Generate KB entry links
		List<Faq> faqs = null;
		faqs = solrService.listFaqs(SolrService.CONTEXT_ID_PUBLIC);		
		for (Faq faq : faqs) {
			writer.write("http://scandilabs.com/technology/knowledge/");
			writer.write(faq.getKey());
			writer.write("\n");
		}
		
		reader.close();		
		response.flushBuffer();
	}

}
