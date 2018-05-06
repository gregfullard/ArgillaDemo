package com.argilla.demo.pages;

import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;

import net.serenitybdd.core.pages.WebElementFacade;
import java.util.stream.Collectors;

import net.serenitybdd.core.annotations.findby.FindBy;

import net.thucydides.core.pages.PageObject;

import java.util.ArrayList;
import java.util.List;

//@DefaultUrl("http://localhost:8090/dev-manual/html/index.html")
@DefaultUrl("http://argilla-nginx:80/dev-manual/html/index.html")
public class DeveloperManualTocPage extends PageObject {

	public void reviewEntries() {
		System.out.println("Finding all List Elements on the Page:");
		
		//List<WebElementFacade> ulElementsList = findAll(By.tagName("ul"));
		List<WebElementFacade> ulElementsList = findAll(By.cssSelector("li.toctree-l1"));
		
		for(WebElement el:ulElementsList) {
			System.out.println(el.getTagName() + " : " + el.getText());	
		}
	}

	public List<String> getEntries() {
		System.out.println("Build List of all ToC entries:");
		
		//WebElementFacade entryList = find(By.tagName("ul"));
		//return entryList.findElements(By.cssSelector("li.toctree-l1")).stream().map(element -> element.getText())
		//		.collect(Collectors.toList());
		
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

	// @FindBy(name="search")
	// private WebElementFacade searchTerms;
	//
	// @FindBy(name="go")
	// private WebElementFacade lookupButton;
	//
	// public void enter_keywords(String keyword) {
	// searchTerms.type(keyword);
	// }
	//
	// public void lookup_terms() {
	// lookupButton.click();
	// }
	//
	// public List<String> getDefinitions() {
	// WebElementFacade definitionList = find(By.tagName("ol"));
	// return definitionList.findElements(By.tagName("li")).stream()
	// .map( element -> element.getText() )
	// .collect(Collectors.toList());
	// }
}