Feature: Log in with username and password
  In order to gain gain entry into the system
  As an under cover agent
  I want to log int with my username and password

  @Pending
  Scenario: Login with valid username and password
    Given the user is on login page
    When the user supplies valid login credentials
    And selects to log in
    Then they should be successfully logged in
    And the home page should be displayed

