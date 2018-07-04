Feature: View Developer Manual Table of Contents
  In order to get an overview of the manual
  As a Developer
  I want to look at the table of contents of the manual

  @Testing
  Scenario: Find 'Getting Started' section in the manual
    Given the user is on the Developer Manual home page
    When the user reviews the contents of the table of contents
    Then they should see an entry for the 'Getting Started' page

