package com.scandilabs.www.util;

import java.util.Comparator;
import java.util.List;
import java.util.Set;
import java.util.SortedSet;
import java.util.TreeSet;

import com.scandilabs.www.entity.Faq;
import com.scandilabs.www.entity.NestedTag;

public class FaqUtils {

	private FaqUtils() {
	}

    /**
     * Create keyword list from all tags and categories
     * @return
     */
    public static Set<String> extractKeywords(List<Faq> faqs) {
        SortedSet<String> keywords = new TreeSet<String>(new Comparator() {

        	public int compare(Object arg0, Object arg1) {
        		String a = (String) arg0;
        		String b = (String) arg1;
        		return a.compareToIgnoreCase(b);
			}
        	
        });
        for (Faq faq : faqs) {
            
        	for (int i = 0; i < faq.getNestedTags().length; i++) {
        		NestedTag tag = faq.getNestedTags()[i];
        		if (tag != null) {
            		for (String term : tag.getElements()) {
       	                keywords.add(term);    
       	            }
        		}
        	}
        }
        
        return keywords;
        
    }
}
