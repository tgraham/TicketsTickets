Feature: Submit Ticket Reply
  As a registered user of the website
  I want to submit a ticket reply
  so I can help a user

  Background: 
    Given there is a ticket called "Hello World" with a description of "Nice to see you."
    And I am on the ticket page

  @wip
  Scenario: I submit a ticket reply
    When I fill in "Comment" with "Hello World!"
    And I press "Submit"
    Then I should see "Ticket successfully answered"
