Feature: Sign in and out
  As a person
  So that I can be recoreded in an accurate manner
  
  Scenario: Sign in and out
    Given I am on the home page
    When I follow "Sign_In"
    And I fill in the fields on the sign in page
    And I press "Sign_In"
    Then I should be on the home page
    And I should see a sign in confirmation
    When I follow "Sign_Out"
    And I follow "Sign_out_testname"
    Then I should be on the home page
    And I should see a sign out confirmation   
