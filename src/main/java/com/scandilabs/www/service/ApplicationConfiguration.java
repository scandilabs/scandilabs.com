package com.scandilabs.www.service;


/**
 * A Java class representation of per-environment application configuration settings (typically found in /sl/apps/[my-app]/conf/application.properties)
 * @author mkvalsvik
 *
 */
public class ApplicationConfiguration {
	
	private String tutorialFileOverridePath;
	private String wordpressUser;
	private String wordpressPassword;

	public String getTutorialFileOverridePath() {
		return tutorialFileOverridePath;
	}

	public void setTutorialFileOverridePath(String tutorialFileOverridePath) {
		this.tutorialFileOverridePath = tutorialFileOverridePath;
	}

	public String getWordpressUser() {
		return wordpressUser;
	}

	public void setWordpressUser(String wordpressUser) {
		this.wordpressUser = wordpressUser;
	}

	public String getWordpressPassword() {
		return wordpressPassword;
	}

	public void setWordpressPassword(String wordpressPassword) {
		this.wordpressPassword = wordpressPassword;
	}

}
