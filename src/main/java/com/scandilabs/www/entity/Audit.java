package com.scandilabs.www.entity;

import java.util.Date;

import org.apache.commons.lang.RandomStringUtils;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrInputDocument;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.scandilabs.catamaran.type.Name;
import com.scandilabs.catamaran.util.Timestamped;
import com.scandilabs.www.service.SolrService;

public class Audit implements Comparable<Object>, Timestamped {
    
    private Logger logger = LoggerFactory.getLogger(Audit.class);
    
    private String key;
    private String contextId;
    private String body;
    private String faqForeignKey;
    private String ownerKey;
    private String shortId; // Used for html links etc
    private Name ownerName;
	private Date createdTime;
	private Date lastModifiedTime;
    
    private static SolrService solrService;
    
    /**
     * Used so that we can distinguish between a key and a short id by a simple String.startsWith
     */
    public static final String SHORT_ID_PREFIX = "AUDITSHORTID";
    
    public Audit() {    
        if (this.shortId == null) {
            this.shortId = SHORT_ID_PREFIX + RandomStringUtils.randomAlphanumeric(10);    
        }        
    }
    
    public Audit(SolrDocument doc) {

        this.key = (String) doc.getFieldValue("key");
        this.shortId = (String) doc.getFieldValue("short-id");
        this.contextId = (String) doc.getFieldValue("context-id");
        this.body = (String) doc.getFieldValue("body");
        this.faqForeignKey = (String) doc.getFieldValue("faq-foreign-key");
        this.ownerKey = (String) doc.getFieldValue("owner-key");
        this.createdTime = (Date) doc.getFieldValue("created");
        this.lastModifiedTime = (Date) doc.getFieldValue("modified-time");
        String ownerNameStr =  (String) doc.getFieldValue("owner-name");
        if (StringUtils.hasText(ownerNameStr)) {
            this.ownerName = Name.createFromFullNameString(ownerNameStr);    
        }        
    }

    public SolrInputDocument toSolrInputDocument() {
        SolrInputDocument inputDoc = new SolrInputDocument();

        inputDoc.addField("key", this.getKey());
        inputDoc.addField("short-id", this.getShortId());
        inputDoc.addField("context-id", this.getContextId());
        inputDoc.addField("body", this.getBody());
        inputDoc.addField("faq-foreign-key", this.getFaqForeignKey());
        inputDoc.addField("owner-name", this.getOwnerName());
        inputDoc.addField("created", this.getCreatedTime());
        inputDoc.addField("modified-time", this.getLastModifiedTime());

        // Default field for all solr docs of this type/class
        inputDoc.addField("document-type", SolrService.DOCUMENT_TYPE_AUDIT);
        
        return inputDoc;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public static void setSolrService(SolrService service) {
        solrService = service;
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

	@Override
	public int compareTo(Object o) {
		Audit otherFaq = (Audit) o;
		return this.body.compareToIgnoreCase(otherFaq.getBody());
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
		if (StringUtils.hasText(this.body)) {
			return String.format("On %s, %s %s for faq %s", this.getLastModifiedTime(), this.getOwnerName(), this.getBody(), this.getFaqForeignKey());
		}
		if (StringUtils.hasText(this.key)) {
			return "audit key: " + this.key;
		}
		return "Empty_AUDIT";
	}

	public String getBody() {
		return body;
	}

	public void setBody(String body) {
		this.body = body;
	}

	public String getFaqForeignKey() {
		return faqForeignKey;
	}

	public void setFaqForeignKey(String faqForeignKey) {
		this.faqForeignKey = faqForeignKey;
	}

}
