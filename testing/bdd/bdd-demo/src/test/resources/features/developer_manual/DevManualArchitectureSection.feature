Feature: View Developer Manual Architecture Section
  In order to fully understand the solution architecture
  As a Developer
  I want to look at the various views of the architecture

  @Testing
  Scenario: Find 'Logical View' in 4+1 Architecture in the manual
    Given the user has opened the Developer Manual
    And the user is browsing the architecture index page
    When the user reviews the contents of the table of contents
    Then they should see an entry for the 'Logical View' page

