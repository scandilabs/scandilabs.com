package org.catamarancode.faq.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrInputDocument;
import org.catamarancode.faq.service.SolrService;
import org.catamarancode.faq.service.support.Visibility;
import org.catamarancode.faq.util.CatamaranMarkdown;
import org.catamarancode.type.Name;
import org.catamarancode.util.Timestamped;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

public class Faq implements Comparable<Object>, Timestamped {
    
    private Logger logger = LoggerFactory.getLogger(Faq.class);
    
    private String key;
    private String contextId;
    private String question;
    private String answer;
    private String ownerKey;
    private String shortId; // Used for html links etc
    private Name ownerName;
    private NestedTag[] nestedTags = new NestedTag[4];
	private Date createdTime;
	private Date lastModifiedTime;
	private Visibility visibility;
    
    private static SolrService solrService;
    
    /**
     * Used so that we can distinguish between a key and a short id by a simple String.startsWith
     */
    public static final String SHORT_ID_PREFIX = "FAQSHORTID";
    
    public Faq() {    
        if (this.shortId == null) {
            this.shortId = SHORT_ID_PREFIX + RandomStringUtils.randomAlphanumeric(10);    
        }        
    }
    
    public Faq(SolrDocument doc) {

        this.key = (String) doc.getFieldValue("key");
        this.shortId = (String) doc.getFieldValue("short-id");
        this.contextId = (String) doc.getFieldValue("context-id");
        this.question = (String) doc.getFieldValue("question");
        this.answer = (String) doc.getFieldValue("answer");
        this.ownerKey = (String) doc.getFieldValue("owner-key");
        this.createdTime = (Date) doc.getFieldValue("created");
        this.lastModifiedTime = (Date) doc.getFieldValue("modified-time");
        String ownerNameStr =  (String) doc.getFieldValue("owner-name");
        if (StringUtils.hasText(ownerNameStr)) {
            this.ownerName = Name.createFromFullNameString(ownerNameStr);    
        }        
        String visibilityStr = (String) doc.getFieldValue("visibility");
        if (StringUtils.hasText(visibilityStr)) {
        	this.visibility = Visibility.valueOf(visibilityStr);
        } else {
        	this.visibility = Visibility.CONTEXT;
        }

        for (int i = 0; i < nestedTags.length; i++) {        	
        	for (int j = 0; j < 4; j++) {
        		String value = (String) doc.getFieldValue("tag-" + (i+1) + "-" + (j+1));
        		boolean hasValue = StringUtils.hasText(value);
        		if (j == 0 && hasValue) {
        			this.nestedTags[i] = new NestedTag();
        		} 
        		if (this.nestedTags[i] == null && hasValue) {
        			throw new RuntimeException("Bad solr data, a field like 'tag-2-1' was populated while 'tag-1-1' was null.");
        		}
        		if (hasValue) {
        			this.nestedTags[i].addElement(value);	
        		}        		
        	}
        }
    }

    public SolrInputDocument toSolrInputDocument() {
        SolrInputDocument inputDoc = new SolrInputDocument();

        inputDoc.addField("key", this.getKey());
        inputDoc.addField("short-id", this.getShortId());
        inputDoc.addField("context-id", this.getContextId());
        inputDoc.addField("question", this.getQuestion());
        inputDoc.addField("answer", this.getAnswer());
        inputDoc.addField("owner-key", this.getOwnerKey());
        inputDoc.addField("owner-name", this.getOwnerName());
        inputDoc.addField("created", this.getCreatedTime());
        inputDoc.addField("modified-time", this.getLastModifiedTime());
        inputDoc.addField("visibility", this.getVisibility().name());
        
        for (int i = 0; i < this.nestedTags.length; i++) {
        	int j = 0;
        	if (this.nestedTags[i] != null) {
	        	for (String s : this.nestedTags[i].getElements()) {
	        		inputDoc.addField("tag-" + (i+1) + "-" + (j+1), s);
	        		j++;
	        	}
        	}
        }

        // Default field for all solr docs of this type/class
        inputDoc.addField("document-type", "FAQ");
        
        return inputDoc;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getQuestion() {
        return question;
    }

    public static void setSolrService(SolrService service) {
        solrService = service;
    }
    
    /**
     * Sets the question variable and also sets the key value based on the question
     * @param question
     */
    public void setQuestion(String question) {
        this.question = question;
        if (this.key == null) {
            
        	// We must have a question, otherwise create default string
        	if (!StringUtils.hasText(question)) {
        		question = "Missing question";
        	}
        	
            // Create key from question
            String strippedQuestion = question.replaceAll("[^A-Za-z0-9]", "_");
            String newKey = null;
            if (strippedQuestion.length() > 20) {
                newKey = strippedQuestion.substring(0, 20);
            } else {
                newKey = strippedQuestion;
            }
            
            // Replace spaces with underscores
            newKey = newKey.replace(" ", "_");
            
            // Make sure name is unique            
            Faq dupe = solrService.loadFaq(newKey);
            int suffix = 1;
            while (dupe != null) {
                newKey = newKey.concat(String.valueOf(suffix));
                logger.debug("Trying alternate key: " + newKey);
                dupe = solrService.loadFaq(newKey);
                suffix++;
            }
            
            this.setKey(newKey);
        }
    }

    public String getAnswer() {
        return answer;
    }
    
    public String getAnswerAsMarkdown() {
    	CatamaranMarkdown m = new CatamaranMarkdown(); 
    	return m.markdown(this.answer);
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
    
    public String getContextId() {
        return contextId;
    }

    public void setContextId(String contextId) {
        this.contextId = contextId;
    }

    public String getOwnerKey() {
        return ownerKey;
    }

    public void setOwnerKey(String ownerId) {
        this.ownerKey = ownerId;
    }

    public Name getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(Name ownerName) {
        this.ownerName = ownerName;
    }

    public String getShortId() {
        return shortId;
    }

	public NestedTag[] getNestedTags() {
		return nestedTags;
	}
	
	public List<NestedTag> getNestedTagsAsList() {
		List<NestedTag> tagList = new ArrayList<NestedTag>();
		for (int i = 0; i < nestedTags.length; i++) {
			if (nestedTags[i] != null) {
				tagList.add(nestedTags[i]);	
			}			
		}
		return tagList;
	}
	
	public String getTag11() {
		return getTagValue(0,0);
	}
	public String getTag12() {
		return getTagValue(0,1);
	}
	public String getTag13() {
		return getTagValue(0,2);
	}
	public String getTag14() {
		return getTagValue(0,3);
	}
	public String getTag21() {
		return getTagValue(1,0);
	}
	public String getTag22() {
		return getTagValue(1,1);
	}
	public String getTag23() {
		return getTagValue(1,2);
	}
	public String getTag24() {
		return getTagValue(1,3);
	}
	public String getTag31() {
		return getTagValue(2,0);
	}
	public String getTag32() {
		return getTagValue(2,1);
	}
	public String getTag33() {
		return getTagValue(2,2);
	}
	public String getTag34() {
		return getTagValue(2,3);
	}
	public String getTag41() {
		return getTagValue(3,0);
	}
	public String getTag42() {
		return getTagValue(3,1);
	}
	public String getTag43() {
		return getTagValue(3,2);
	}
	public String getTag44() {
		return getTagValue(3,3);
	}
	
	private String getTagValue(int i, int j) {
		NestedTag tag = this.nestedTags[i];
		if (tag == null) {
			return null;			
		}
		if (tag.getElements().size() > j) {
			return tag.getElements().get(j);
		}
		return null;
	}

	@Override
	public int compareTo(Object o) {
		Faq otherFaq = (Faq) o;
		return this.question.compareToIgnoreCase(otherFaq.getQuestion());
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getLastModifiedTime() {
		return lastModifiedTime;
	}

	public void setLastModifiedTime(Date lastModifiedTime) {
		this.lastModifiedTime = lastModifiedTime;
	}

	public String toString() {
		if (StringUtils.hasText(this.question)) {
			return this.question;
		}
		if (StringUtils.hasText(this.key)) {
			return "key: " + this.key;
		}
		return "Empty_FAQ";
	}

	public Visibility getVisibility() {
		return visibility;
	}

	public void setVisibility(Visibility visibility) {
		this.visibility = visibility;
	}
}
