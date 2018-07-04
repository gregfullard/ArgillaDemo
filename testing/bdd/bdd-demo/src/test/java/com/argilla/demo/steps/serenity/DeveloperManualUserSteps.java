package com.argilla.demo.steps.serenity;

import com.argilla.demo.pages.DevManualPage;
import com.argilla.demo.pages.DeveloperManualArchitectureIndexPage;
import com.argilla.demo.pages.DeveloperManualTocPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasItem;

public class DeveloperManualUserSteps {

	DeveloperManualTocPage devManualTocPage;
	DeveloperManualArchitectureIndexPage devManualArchIndexPage;

	DevManualPage openedPage;

	@Step
	public void is_on_the_developer_manual_home_page() {
		devManualTocPage.open();
		openedPage = DevManualPage.MAIN_TOC;
	}

	@Step
	public void reviews_entries_in_toc() {
		switch (openedPage) {
		case MAIN_TOC:
			devManualTocPage.reviewEntries();
			break;
		case ARCHITECTURE_TOC:
			devManualArchIndexPage.reviewEntries();
			break;
		default :
			break;
		}
	}

	@Step
	public void should_see_an_entry_for_page_in_toc(String pageTitle) {
		switch (openedPage) {
		case MAIN_TOC:
			assertThat(devManualTocPage.getEntries(), hasItem(containsString(pageTitle)));
			break;
		case ARCHITECTURE_TOC:
			assertThat(devManualArchIndexPage.getEntries(), hasItem(containsString(pageTitle)));
			break;
		default :
			break;
		}		
	}

	@Step
	public void opens_the_architecture_index_page() {
		devManualArchIndexPage.open();
		openedPage = DevManualPage.ARCHITECTURE_TOC;
	}

}