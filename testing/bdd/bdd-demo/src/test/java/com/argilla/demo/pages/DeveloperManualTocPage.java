package com.argilla.demo.pages;

import net.thucydides.core.annotations.DefaultUrl;
import org.openqa.selenium.By;
import org.openqa.selenium.WebElement;
import net.serenitybdd.core.pages.WebElementFacade;
import java.util.stream.Collectors;

import net.serenitybdd.core.annotations.findby.FindBy;

import net.thucydides.core.pages.PageObject;

import java.util.List;

@DefaultUrl("http://localhost:8090/dev-manual/html/index.html")
public class DeveloperManualTocPage extends PageObject {

	public void reviewEntries() {
		// TODO: No Implementation needed for now
	}

	public List<String> getEntries() {
		WebElementFacade entryList = find(By.tagName("ol"));
		return entryList.findElements(By.tagName("li")).stream().map(element -> element.getText())
				.collect(Collectors.toList());
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