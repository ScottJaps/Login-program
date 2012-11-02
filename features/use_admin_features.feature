Feature: Use admin features
  so an admin can sort and restrict the amount of infomation on the screen
  
Background: Users in database
  Given volunteers exist

  
  
  Scenario: Sort by date
    Given I am on the staff view page
    When I follow "Date"
    Then I should be on the staff view page
    And I should see "test2" before "test1"
    
  Scenario: Sort by name
    Given I am on the staff view page
    When I follow "Name"
    Then I should be on the staff view page
    And I should see "test1" before "test2"
    And I should see "test2" before "testaa"
    And I should see "testaa" before "testbb"
  
  Scenario: Sort by Phone Number or Email
    Given I am on the staff view page
    When I follow "Phone Number or Email"
    Then I should be on the staff view page
    And I should see "test1" before "test2"
    And I should see "test2" before "testbb"
    And I should see "testbb" before "testaa"
    
    
  Scenario: filter by program
    Given I am on the staff view page
    When I select "Other" from "program"
    And I press "Refresh"
    Then I should see "test2"
    And I should see "testaa"
    And I should not see "test1"
    And I should not see "testbb"
    
    
  Scenario: filter by name
    Given I am on the staff view page
    When I fill in "name" with "test2"
    And I press "Refresh"
    Then I should see "test2"
    And I should not see "testaa"
    And I should not see "test1"
    And I should not see "testbb"  
