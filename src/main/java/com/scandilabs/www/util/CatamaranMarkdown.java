package com.scandilabs.www.util;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.StringReader;
import java.io.StringWriter;
import java.net.URL;

import com.petebevin.markdown.MarkdownProcessor;

/**
 * A thin wrapper around com.petebevin.markdown.MarkdownProcessor that provides some additional syntax support
 * modelled on http://michelf.ca/projects/php-markdown/extra/
 * @author mkvalsvik
 *
 */
public class CatamaranMarkdown {
	
	/**
	 * TODO: Add constructor with a simple static cacheing support
	 * @param markdownContent
	 * @return
	 */
	public String markdown(String markdownContent) {
		
		BufferedReader b = new BufferedReader(new StringReader(markdownContent));
    	StringWriter w = new StringWriter();
    	
    	// Additional tag support -- tilde etc -- see http://michelf.ca/projects/php-markdown/extra/#fenced-code-blocks
    	String line = null;
    	try {    		
    		boolean indent = false;
    		while ((line = b.readLine()) != null) {
    			if (line.startsWith("~~~")) {
    				if (indent) {
    					indent = false;
    				} else {
    					indent = true;
    				}    			
    				w.write("\r\n");
    			} else if (indent) {
    				w.write("    ");
    				w.write(line);
    				w.write("\r\n");
    			} else {
    				w.write(line);
    				w.write("\r\n");
    			}
    		}
    	} catch (IOException e) {
    		throw new CatamaranMarkdownException("Markdown pre-parsing error near line: " + line, e);
    	}
    	
    	MarkdownProcessor m = new MarkdownProcessor(); 
    	return m.markdown(w.toString());		
	}


}
