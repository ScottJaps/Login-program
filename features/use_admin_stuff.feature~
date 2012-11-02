Feature: Get to the view all page
  So that a person can see the entries
  
  Scenario: admin sign in wrong
    Given I am on the home page
    When I follow "staff_login"
    And I fill in the sign in password wrong and submit
    Then I should be on the staff login page
    And I should see "wrong password"
  
  
  Scenario: admin sign in correctly
    Given I am on the staff view page
    Given I am on the home page
    When I follow "staff_login"
    And I fill in the sign in password and submit
    Then I should be on the staff view page
