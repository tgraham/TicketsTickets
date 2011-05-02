Feature: Signing up
In order to create tickets
As a user
I want to be able to sign up
    
Scenario: Signing up
  Given I am on the homepage
  When I follow "Sign up"
  And I fill in "Full Name" with "John Doe"
  And I fill in "Login" with "johndoe"
  And I fill in "Email" with "john@doe.com"
  And I fill in "Password" with "password"
  And I fill in "Password confirmation" with "password" 
  And I press "Sign up"
  Then I should see "You have signed up successfully."
  
Scenario: User signs up with invalid email
  Given I am not logged in
  When I go to the sign up page
  And I fill in "Email" with "invalidemail"
  And I fill in "Password" with "please"
  And I fill in "Password confirmation" with "please"
  And I press "Sign up"
  Then I should see "Email is invalid"

Scenario: User signs up without password
  Given I am not logged in
  When I go to the sign up page
  And I fill in "Email" with "user@test.com"
  And I fill in "Password" with ""
  And I fill in "Password confirmation" with "please"
  And I press "Sign up"
  Then I should see "Password can't be blank"

Scenario: User signs up without password confirmation
  Given I am not logged in
  When I go to the sign up page
  And I fill in "Email" with "user@test.com"
  And I fill in "Password" with "please"
  And I fill in "Password confirmation" with ""
  And I press "Sign up"
  Then I should see "Password doesn't match confirmation"

Scenario: User signs up with password and password confirmation that doesn't match
  Given I am not logged in
  When I go to the sign up page
  And I fill in "Email" with "user@test.com"
  And I fill in "Password" with "please"
  And I fill in "Password confirmation" with "please1"
  And I press "Sign up"
  Then I should see "Password doesn't match confirmation"
