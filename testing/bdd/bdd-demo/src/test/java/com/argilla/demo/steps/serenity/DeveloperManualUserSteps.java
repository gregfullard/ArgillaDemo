package com.argilla.demo.steps.serenity;

import com.argilla.demo.pages.DeveloperManualTocPage;
import net.thucydides.core.annotations.Step;
import net.thucydides.core.steps.ScenarioSteps;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.hamcrest.Matchers.hasItem;


public class DeveloperManualUserSteps {

	DeveloperManualTocPage devManualTocPage;

    @Step
    public void is_on_the_developer_manual_home_page() {
    	devManualTocPage.open();
    }
    
    @Step
    public void reviews_entries_in_toc() {
    	devManualTocPage.reviewEntries();
    }   
    
    @Step
    public void should_see_an_entry_for_page(String pageTitle) {
    	assertThat(devManualTocPage.getEntries(), hasItem(containsString(pageTitle)));
    }     

}