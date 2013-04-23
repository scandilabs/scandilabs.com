package org.catamarancode.faq.service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.ListUtils;
import org.apache.solr.client.solrj.SolrQuery;
import org.apache.solr.client.solrj.SolrQuery.ORDER;
import org.apache.solr.client.solrj.SolrServer;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.response.QueryResponse;
import org.apache.solr.common.SolrDocument;
import org.apache.solr.common.SolrDocumentList;
import org.apache.solr.common.SolrInputDocument;
import org.catamarancode.faq.entity.Audit;
import org.catamarancode.faq.entity.Comment;
import org.catamarancode.faq.entity.Faq;
import org.catamarancode.faq.entity.NestedTag;
import org.catamarancode.faq.entity.User;
import org.catamarancode.faq.service.support.Visibility;
import org.catamarancode.util.CollectionUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.scandilabs.framework.solr.SearchQuery;
import com.scandilabs.framework.solr.SolrServerConfig;

public class SolrService {
    
	public static final String CONTEXT_ID_PUBLIC = "public";
	public static final String DOCUMENT_TYPE_FAQ = "FAQ";
	public static final String DOCUMENT_TYPE_USER = "USER";
	public static final String DOCUMENT_TYPE_COMMENT = "COMMENT";
	public static final String DOCUMENT_TYPE_AUDIT = "AUDIT";
	
    private static final long DEFAULT_ROWS = 200;
    
    static Logger logger = LoggerFactory.getLogger(SolrService.class
            .getName());
    
    private SolrServerConfig solrServerConfig;
    
    public SolrService(SolrServerConfig solrServerConfig) {
        this.solrServerConfig = solrServerConfig;
    }

    public List<Faq> listFaqs(String contextId) {
        return this.searchFaq(null, contextId);
    }

    public List<Audit> listAudits(String contextId) {
    	List<Audit> list = this.searchAudit(null, contextId);
    	if (list != null) {
    		return list;
    	}
    	return (List<Audit>) ListUtils.EMPTY_LIST;
    }
    
    public List<Audit> listAudits(Faq faq) {
    	List<Audit> list = this.searchAudit(faq, faq.getContextId());
    	if (list != null) {
    		return list;
    	}
    	return (List<Audit>) ListUtils.EMPTY_LIST;
    }
    
    public List<Comment> listComments(Faq faq) {
    	List<Comment> list = this.searchComment(faq, faq.getContextId());
    	if (list != null) {
    		return list;
    	}
    	return (List<Comment>) ListUtils.EMPTY_LIST;
    }
    
    public List<User> listUsers() {
        return this.searchForUsers(null);
    }    

   public Faq loadFaq(String id) {
        
        if (!StringUtils.hasText(id)) {
            return null;
        }
        
        List<Faq> faqs = null;
        if (id.startsWith(Faq.SHORT_ID_PREFIX)) {
            faqs = this.searchFaq("short-id:" + id, null);
        } else {
            faqs = this.searchFaq("key:" + id, null);
        }
                
        if (faqs.isEmpty()) {
            return null;
        }
        return faqs.get(0);
    }
    
    public User loadUser(String id) {
    	List<User> users = this.searchForUsers("key:" + id);
    	if (users != null && !users.isEmpty()) {
    		return (User) CollectionUtils.findOne(users);
    	}    		
    	return null;
    }
    
    public Audit loadAudit(String key, String contextId) {
    	String modifiedQuery = null;
        modifiedQuery = "document-type:" + DOCUMENT_TYPE_AUDIT + " AND key:" + key;
        
        // Search
        QueryResponse queryResponse = this.search(modifiedQuery, contextId, null, 200, 0);
        List<Audit> audits = extractAudits(queryResponse);    	
    	if (audits != null && !audits.isEmpty()) {
    		return (Audit) CollectionUtils.findOne(audits);
    	}    		
    	return null;
    }    
    
    public Comment loadComment(String key, String contextId) {
    	String modifiedQuery = null;
        modifiedQuery = "document-type:" + DOCUMENT_TYPE_COMMENT + " AND key:" + key;
        
        // Search
        QueryResponse queryResponse = this.search(modifiedQuery, contextId, null, 200, 0);
        List<Comment> comments = extractComments(queryResponse);    	
    	if (comments != null && !comments.isEmpty()) {
    		return (Comment) CollectionUtils.findOne(comments);
    	}    		
    	return null;
    }
    
    public User findUserByEmail(String email) {
    	List<User> users = this.searchForUsers("email:" + email);
    	if (users != null && !users.isEmpty()) {
    		return (User) CollectionUtils.findOne(users);
    	}    		
    	return null;
    }

    public List<Faq> searchFaq(String query, String contextId) {
        return searchFaq(query, contextId, null);
    }
    
    public List<Faq> searchFaq(String query, String contextId, Map<String, String> facetFields) {
        return searchFaq(query, contextId, facetFields, 20, 0);
    }
    
    public List<Audit> searchAudit(Faq faq, String contextId) {
        String modifiedQuery = null;
        if (faq != null) {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_AUDIT + " AND faq-foreign-key:" + faq.getKey();
        } else {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_AUDIT + " AND context-id:" + contextId;
        }
        
        // Search
        QueryResponse queryResponse = this.search(modifiedQuery, contextId, null, 200, 0);
        return extractAudits(queryResponse);
    }
    
    public List<Comment> searchComment(Faq faq, String contextId) {
    	String modifiedQuery = null;
        if (faq != null) {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_COMMENT + " AND faq-foreign-key:" + faq.getKey();
        } else {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_COMMENT + " AND context-id:" + contextId;
        }
        
        // Search
        QueryResponse queryResponse = this.search(modifiedQuery, contextId, null, 200, 0);
        return extractComments(queryResponse);
    }
    
    public List<Faq> searchFaq(String query, String contextId, Map<String, String> facetFields, long rows, long startRow) {
        String modifiedQuery = null;
        if (StringUtils.hasText(query)) {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_FAQ + " AND " + query;
        } else {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_FAQ;
        }
        
        // Search
        QueryResponse queryResponse = this.search(modifiedQuery, contextId, facetFields, rows, startRow);
        return extractFaqs(queryResponse);
    }
    
    public List<User> searchForUsers(String query) {
        return searchForUsers(query, null, DEFAULT_ROWS, 0);
    }
    
    public List<User> searchForUsers(String query, Map<String, String> facetFields, long rows, long startRow) {
        String modifiedQuery = null;
        if (StringUtils.hasText(query)) {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_USER + " AND " + query;
        } else {
            modifiedQuery = "document-type:" + DOCUMENT_TYPE_USER;
        }
        
        // Search. Using null context since users are (presently) limited to admins anyway
        QueryResponse queryResponse = this.search(modifiedQuery, null, facetFields, rows, startRow);
        return extractUsers(queryResponse);
    }    
    
    /**
     * 
     * @param tag may be null, if so will return all first-level tags
     * @param lenient also return matches to any child-tags
     * @return
     */
    public Set<Faq> findByTag(NestedTag tag, boolean includeChildren, String contextId) {
    	
    	// TODO: Optimize this query
        String query1 = null;
        int nestedLevel = tag.getNestedLevel();
    	query1 = String.format("tag-1-%d:[* TO *] tag-2-%d:[* TO *] tag-3-%d:[* TO *] tag-4-%d:[* TO *]", nestedLevel, nestedLevel, nestedLevel, nestedLevel);
        
        QueryResponse queryResponse = this.search(query1, contextId);
        List<Faq> unfilteredFaqs = this.extractFaqs(queryResponse);
        
        // Weed out "false" matches.
        // Build a uniqe list of category strings based on nested tags that match the term.
        // Note that solr search may return multiple tags per faq so we need to ignore tags that don't match
        Set<Faq> faqs = new HashSet<Faq>();
        for (Faq faq : unfilteredFaqs) {
        	for (int i = 0; i < faq.getNestedTags().length; i++) {
        		NestedTag matchCandidate = faq.getNestedTags()[i];
        		if (matchCandidate == null) {
        			continue;
        		}
        		
        		if (!matchCandidate.match(tag, includeChildren)) {
        			continue;
        		}
        		
				// We have a match
				faqs.add(faq);
        	}
        }        
        
        return faqs;
    }
    
    /**
     * @param nestedLevel 1-base tag nested level where 1 is the top tag element
     * @param term the search term, may be null or empty string
     * @param element1 Prior (higher-level) tag value. Only applies if nestedLevel is 2 or higher.
     * @return a unique, set of faq's
     */
    public Set<Faq> searchByNestedTag(NestedTag parentTag, String partialTerm, String contextId) {
    	
        String query1 = null;
        int nestedLevel = 1;
        if (parentTag != null) {
        	nestedLevel = parentTag.getNestedLevel() + 1;	
        }
        
    	// TODO: Optimize this query
        if (StringUtils.hasText(partialTerm)) {
        	query1 = String.format("tag-1-%d:%s* tag-2-%d:%s* tag-3-%d:%s* tag-4-%d:%s*", nestedLevel, partialTerm, nestedLevel, partialTerm, nestedLevel, partialTerm, nestedLevel, partialTerm);
        } else {
        	query1 = String.format("tag-1-%d:[* TO *] tag-2-%d:[* TO *] tag-3-%d:[* TO *] tag-4-%d:[* TO *]", nestedLevel, nestedLevel, nestedLevel, nestedLevel);
        }
        
        QueryResponse queryResponse = this.search(query1, contextId);
        List<Faq> unfilteredFaqs = this.extractFaqs(queryResponse);
        
        // Weed out "false" matches.
        // Build a uniqe list of category strings based on nested tags that match the term.
        // Note that solr search may return multiple tags per faq so we need to ignore tags that don't match
        Set<Faq> faqs = new HashSet<Faq>();
        for (Faq faq : unfilteredFaqs) {
        	for (int i = 0; i < faq.getNestedTags().length; i++) {
        		NestedTag matchCandidate = faq.getNestedTags()[i];
        		if (matchCandidate == null) {
        			continue;
        		}
        		
        		// Match parents
        		if (parentTag != null) {
        			NestedTag candidateParentComparisonTag = matchCandidate.getTagAtLevel(parentTag.getNestedLevel());
        			if (candidateParentComparisonTag == null) {
        				
        				// Candidate tag is not tall enough
        				continue;
        			} else {
        				
        				if (!candidateParentComparisonTag.match(parentTag)) {
        					
        					// Parents don't match
        					continue;
        				}
        			}
        		}
        		
        		// Does the faq result match the original term at this level?
        		if (StringUtils.hasText(partialTerm)) {	        		
	    			if (!matchCandidate.getElementAtLevel(nestedLevel).startsWith(partialTerm)) {
	    				continue;
	    			}
        		}
        		
				// We have a match
				faqs.add(faq);
        	}
        }        
        
        return faqs;
    }
    
    public List<Faq> extractFaqs(QueryResponse queryResponse) {
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        int solrTotalHits = ((int) solrDocumentList.getNumFound());
        
        // Process every Solr Document returned back
        List<Faq> faqs = new ArrayList<Faq>();
        for (SolrDocument doc : solrDocumentList) {
            Faq faq = new Faq(doc);
            faqs.add(faq);
        }

        return faqs;
    }
    
    private List<User> extractUsers(QueryResponse queryResponse) {
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        int solrTotalHits = ((int) solrDocumentList.getNumFound());
        
        // Process every Solr Document returned back
        List<User> users = new ArrayList<User>();
        for (SolrDocument doc : solrDocumentList) {
            User user = new User(doc);
            users.add(user);
        }

        return users;
    }
    
    private List<Audit> extractAudits(QueryResponse queryResponse) {
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        int solrTotalHits = ((int) solrDocumentList.getNumFound());
        
        // Process every Solr Document returned back
        List<Audit> docs = new ArrayList<Audit>();
        for (SolrDocument doc : solrDocumentList) {
            Audit audit = new Audit(doc);
            docs.add(audit);
        }

        return docs;
    }
    
    private List<Comment> extractComments(QueryResponse queryResponse) {
        SolrDocumentList solrDocumentList = queryResponse.getResults();
        int solrTotalHits = ((int) solrDocumentList.getNumFound());
        
        // Process every Solr Document returned back
        List<Comment> docs = new ArrayList<Comment>();
        for (SolrDocument doc : solrDocumentList) {
        	Comment c = new Comment(doc);
            docs.add(c);
        }

        return docs;
    }
    
    public QueryResponse search(String query, String contextId) {
        return search(query, contextId, null);
    }
    
    public QueryResponse search(String query, String contextId, Map<String, String> facetFields) {
        return search(query, contextId, facetFields, DEFAULT_ROWS, 0);
    }
    
    private QueryResponse search(SearchQuery searchQuery) {
        SolrQuery solrQuery = searchQuery.getSolrQuery();        
        long start = System.currentTimeMillis();

        // Execute the Solr Query and get the response
        QueryResponse queryResponse;
        try {
            logger.debug(String.format("Executing %s query: %s", searchQuery
                    .getSolrMethod(), solrQuery));
            queryResponse = solrServerConfig.getSolrServer().query(solrQuery,
                    searchQuery.getSolrMethod());
        } catch (SolrServerException e) {
            throw new RuntimeException("Exception during solr search for "
                    + solrQuery.toString(), e);
        }
        long hits = queryResponse.getResults().getNumFound();
        logger.info(String.format(
                "Executed %s, got %d results. Time reported %d, client actual %d", solrQuery, hits, 
                queryResponse.getElapsedTime(),
                (System.currentTimeMillis() - start)));
        return queryResponse;
    }

    public QueryResponse search(String query, String contextId, Map<String, String> facetFields, long rows, long startRow) {
        SearchQuery searchQuery = null;
        if (contextId == null) {
        	searchQuery = new SearchQuery(query);
        } else if (contextId.equals(CONTEXT_ID_PUBLIC)) {
        	searchQuery = new SearchQuery("(" + query + ") AND visibility:" + Visibility.PUBLIC.name());
        } else {
        	searchQuery = new SearchQuery("(" + query + ") AND context-id:" + contextId);
        }

        // Sorting and max rows
        searchQuery.addSortField("question", ORDER.asc);
        if (rows != -1) {
            searchQuery.setRows(rows);
            searchQuery.setPagination(startRow);
        }

        // Set up facets
        if (facetFields != null) {
            List<String> facetFieldList = new ArrayList<String>(facetFields
                    .keySet());
            if (!facetFieldList.isEmpty()) {
                searchQuery.turnFacetOn(true, facetFieldList);
            }
        }

        return this.search(searchQuery);
    }
    
    /**
     * Saves an faq object to solr.  Note that solr will keep track of whether it's an insert or an update. 
     * @param faq
     * @return true if something was added, false o/w
     */
    public boolean save(Faq faq) {
        SolrServer solr = solrServerConfig.getSolrServer();
        SolrInputDocument inputDoc = faq.toSolrInputDocument();
        try {
            solr.add(inputDoc);
            solr.commit();
        } catch (SolrServerException e) {
            throw new RuntimeException(String.format(
                    "Solr error when adding faq %s", faq.getQuestion()), e);
        } catch (IOException e) {
            throw new RuntimeException(String.format(
                    "IOException when adding faq %s", faq.getQuestion()), e);
        }

        logger.debug(String.format("Added %s to solr", faq.getQuestion()));
        return true;
    }
    
    public boolean save(User user) {
        SolrServer solr = solrServerConfig.getSolrServer();
        SolrInputDocument inputDoc = user.toSolrInputDocument();
        try {
            solr.add(inputDoc);
            solr.commit();
        } catch (SolrServerException e) {
            throw new RuntimeException(String.format(
                    "Solr error when adding user", user.getName()), e);
        } catch (IOException e) {
            throw new RuntimeException(String.format(
                    "IOException when adding user", user.getName()), e);
        }

        logger.debug(String.format("Added %s to solr", user.getName()));
        return true;
    }    
    
    public boolean save(Audit audit) {
        SolrServer solr = solrServerConfig.getSolrServer();
        SolrInputDocument inputDoc = audit.toSolrInputDocument();
        try {
            solr.add(inputDoc);
            solr.commit();
        } catch (SolrServerException e) {
            throw new RuntimeException(String.format(
                    "Solr error when adding audit %s", audit), e);
        } catch (IOException e) {
            throw new RuntimeException(String.format(
                    "IOException when adding audit %s", audit), e);
        }

        logger.debug(String.format("Added %s to solr", audit));
        return true;
    }       
    
    public boolean save(Comment comment) {
        SolrServer solr = solrServerConfig.getSolrServer();
        SolrInputDocument inputDoc = comment.toSolrInputDocument();
        try {
            solr.add(inputDoc);
            solr.commit();
        } catch (SolrServerException e) {
            throw new RuntimeException(String.format(
                    "Solr error when adding comment %s", comment), e);
        } catch (IOException e) {
            throw new RuntimeException(String.format(
                    "IOException when adding comment %s", comment), e);
        }

        logger.debug(String.format("Added %s to solr", comment));
        return true;
    }        
}
