Feature: Signing up
In order to create tickets
As a user
I want to be able to sign up
    
Scenario: Signing up
  Given I am on the homepage
  When I follow "Sign up"
  And I fill in "First Name" with "John"
  And I fill in "Last Name" with "Doe"
  And I fill in "Login" with "johndoe"
  And I fill in "Email" with "esparkman@esdezines.com"
  And I fill in "Password" with "password"
  And I fill in "Password confirmation" with "password" 
  And I press "Sign up"
  Then I should see "You have signed up successfully."

