package com.scandilabs.www.service;


/**
 * A Java class representation of per-environment application configuration settings (typically found in /sl/apps/[my-app]/conf/application.properties)
 * @author mkvalsvik
 *
 */
public class ApplicationConfiguration {
	
	private String tutorialFileOverridePath;

	public String getTutorialFileOverridePath() {
		return tutorialFileOverridePath;
	}

	public void setTutorialFileOverridePath(String tutorialFileOverridePath) {
		this.tutorialFileOverridePath = tutorialFileOverridePath;
	}

}
