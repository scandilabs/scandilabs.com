package com.scandilabs.www.web.support;

import java.util.SortedSet;
import java.util.TreeSet;

import com.scandilabs.www.entity.Faq;

public class NestedTagNode implements Comparable<Object> {

	private NestedTagNode parent;
    private String name;
    private SortedSet<NestedTagNode> childNodes = new TreeSet<NestedTagNode>();
    private SortedSet<Faq> faqs = new TreeSet<Faq>();

    public NestedTagNode(NestedTagNode parent) {
    	this.parent = parent;
    }
    
    public NestedTagNode getParent() {
    	return this.parent;
    }
    
    /**
     * Generate a node id that can be used as a jQuery selector
     * @return
     */
    public String getNodeId() {
    	String s = this.getUnderscoreSeparatedName();

    	// remove all characters except letters, numbers, underscores and dashes
    	StringBuilder sb = new StringBuilder();
    	Character ch;
    	for (int i = 0; i < s.length(); i++) {
    		ch = s.charAt(i);
    		if (Character.isLetterOrDigit(ch) || ch == '-' || ch == '_') {
    			sb.append(ch);
    		}
    	}
    	return sb.toString();
    }

    public String getUnderscoreSeparatedName() {
    	StringBuilder sb = new StringBuilder();
    	this.prependParentUnderscoreNames(sb);
    	return sb.toString();
    }
    
    public String getColonSeparatedName() {
    	StringBuilder sb = new StringBuilder();
    	this.prependParentNames(sb);
    	return sb.toString();
    }
    
    public String getColonSeparatedNameNoSpaces() {
    	StringBuilder sb = new StringBuilder();
    	this.prependParentNamesColonNoSpaces(sb);
    	return sb.toString();
    }
    
    public String getPipeSeparatedName() {
    	StringBuilder sb = new StringBuilder();
    	this.prependPipeParentNames(sb);
    	return sb.toString();
    }    
    
    private void prependParentNames(StringBuilder sb) {
    	boolean bottom = true;
    	if (sb.length() > 0) {
    		bottom = false;
    	}    	
    	if (!bottom) {
    		sb.insert(0, this.name + " : ");
    	} else {
    		sb.insert(0, this.name);
    	}
    	if (this.getParent() != null && this.getParent().getName() != null) {
    		this.getParent().prependParentNames(sb);
    	}    	
    }
    
    private void prependParentUnderscoreNames(StringBuilder sb) {
    	boolean bottom = true;
    	if (sb.length() > 0) {
    		bottom = false;
    	}    	
    	if (!bottom) {
    		sb.insert(0, this.name + "_");
    	} else {
    		sb.insert(0, this.name);
    	}
    	if (this.getParent() != null && this.getParent().getName() != null) {
    		this.getParent().prependParentUnderscoreNames(sb);
    	}    	
    }
    
    private void prependParentNamesColonNoSpaces(StringBuilder sb) {
    	boolean bottom = true;
    	if (sb.length() > 0) {
    		bottom = false;
    	}    	
    	if (!bottom) {
    		sb.insert(0, this.name + ":");
    	} else {
    		sb.insert(0, this.name);
    	}
    	if (this.getParent() != null && this.getParent().getName() != null) {
    		this.getParent().prependParentNamesColonNoSpaces(sb);
    	}    	
    }

    private void prependPipeParentNames(StringBuilder sb) {
    	boolean bottom = true;
    	if (sb.length() > 0) {
    		bottom = false;
    	}    	
    	if (!bottom) {
    		sb.insert(0, this.name + "|");
    	} else {
    		sb.insert(0, this.name);
    	}
    	if (this.getParent() != null && this.getParent().getName() != null) {
    		this.getParent().prependPipeParentNames(sb);
    	}    	
    }

    public int getChildCount() {
        return childNodes.size() + faqs.size();
    }
    
    public int getFaqCount() {
        return faqs.size();
    }
    
    public void addFaq(Faq faq) {
        this.faqs.add(faq);
    }
    
    public NestedTagNode getOrCreateChild(String name) {
        
        // Do we have this child already?
        for (NestedTagNode childNode : childNodes) {
            if (childNode.getName().equals(name)) {
                return childNode;
            }
        }
        
        // No.  Create it
        NestedTagNode childNode = new NestedTagNode(this);
        childNode.setName(name);
        this.childNodes.add(childNode);
        return childNode;
    }

    public String getName() {
        return name;
    }

    public void setName(String categoryElement) {
        this.name = categoryElement;
    }

    public SortedSet<NestedTagNode> getChildNodes() {
        return childNodes;
    }

    public void setChildNodes(SortedSet<NestedTagNode> childNodes) {
        this.childNodes = childNodes;
    }

    public SortedSet<Faq> getFaqs() {
        return faqs;
    }

    public void setFaqs(SortedSet<Faq> faqs) {
        this.faqs = faqs;
    }

	@Override
	public int compareTo(Object o) {
		NestedTagNode otherNode = (NestedTagNode) o;
		return this.getColonSeparatedName().compareToIgnoreCase(otherNode.getColonSeparatedName());
	}
}
