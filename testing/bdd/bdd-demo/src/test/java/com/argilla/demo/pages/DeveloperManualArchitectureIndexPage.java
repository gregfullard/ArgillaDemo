package com.argilla.demo.pages;

import java.util.ArrayList;
import java.util.List;

import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import net.serenitybdd.core.pages.WebElementFacade;
import net.thucydides.core.annotations.DefaultUrl;
import net.thucydides.core.pages.PageObject;

@DefaultUrl("http://argilla-nginx:80/dev-manual/html/architecture.html")
public class DeveloperManualArchitectureIndexPage extends PageObject {

	public void reviewEntries() {
		System.out.println("Finding all List Elements on the Page:");

		List<WebElementFacade> ulElementsList = findAll(By.cssSelector("li.toctree-l1"));
		
		for(WebElement el:ulElementsList) {
			System.out.println(el.getTagName() + " : " + el.getText());	
		}
	}

	public List<String> getEntries() {
		System.out.println("Build List of all ToC entries:");
		
		List<String> tocEntriesList = new ArrayList<String>();
		
		List<WebElementFacade> ulElementsList = findAll(By.cssSelector("li.toctree-l1"));
		
		for(WebElement el:ulElementsList) {
			if (!tocEntriesList.contains("el.getText()")) {
				tocEntriesList.add(el.getText());
				System.out.println("Adding " + el.getText() + " to list of TOC Entries");
			}
		}
		
		return tocEntriesList;
	}
	
}