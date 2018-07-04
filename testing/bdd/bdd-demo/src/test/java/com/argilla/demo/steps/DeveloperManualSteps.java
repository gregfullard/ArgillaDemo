package com.argilla.demo.steps;

import net.thucydides.core.annotations.Steps;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

import com.argilla.demo.steps.serenity.DeveloperManualUserSteps;

public class DeveloperManualSteps {
	
	@Steps
	DeveloperManualUserSteps anna;

	@Given("^the user has opened the Developer Manual$")
	public void the_user_has_opened_the_Developer_Manual() throws Exception {
		anna.is_on_the_developer_manual_home_page();
	}

	@Given("^the user is on the Developer Manual home page$")
	public void givenTheUserIsOnTheDeveloperManualHomePage() {
		anna.is_on_the_developer_manual_home_page();
	}

	@When("^the user reviews the contents of the table of contents$")
	public void whenTheUserReviewsTheContentsOfTheTableOfContents() {
		anna.reviews_entries_in_toc();	
	}

	@Then("^they should see an entry for the '(.*)' page$")
	public void thenTheyShouldSeeAnEntryForThePage(String pageTitle) {
		anna.should_see_an_entry_for_page_in_toc(pageTitle);
	}

	@Given("^the user is browsing the architecture index page$")
	public void the_user_is_browsing_the_architecture_index_page() throws Exception {
		anna.opens_the_architecture_index_page();
	}

}
