Feature: Facebook login
  In order to access my data
  as a user
  I want to log in
    using my facebook acount

  Scenario: Find login link
    Given I visit the home page
    And I should see a link with "Join or log in"

  Scenario: Go to login page
    Given I visit the home page
    When I click on "log in"
    Then I should see a button with "Log in with Facebook"
