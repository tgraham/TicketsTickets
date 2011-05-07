Feature: Submit Ticket
  As a registered user of the website
  I want to submit a ticket
  so I can get help

  Scenario: I sign in and submit a ticket
    Given I am a user named "Foo Bar" with an email "user@test.com" and password "please"
    When I sign in as "user@test.com/please"
    Then I should be signed in
    When I follow "Create Ticket"
    And I fill in "Subject" with "Broken"
    And I fill in "Description" with "It's all broked"
    And I select "Medium" from "Priority"
    And I press "Submit"
    Then I should see "Ticket successfully created"