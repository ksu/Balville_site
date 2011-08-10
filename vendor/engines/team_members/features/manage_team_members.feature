@team_members
Feature: Team Members
  In order to have team_members on my website
  As an administrator
  I want to manage team_members

  Background:
    Given I am a logged in refinery user
    And I have no team_members

  @team_members-list @list
  Scenario: Team Members List
   Given I have team_members titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of team_members
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @team_members-valid @valid
  Scenario: Create Valid Team Member
    When I go to the list of team_members
    And I follow "Add New Team Member"
    And I fill in "Name" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 team_member

  @team_members-invalid @invalid
  Scenario: Create Invalid Team Member (without name)
    When I go to the list of team_members
    And I follow "Add New Team Member"
    And I press "Save"
    Then I should see "Name can't be blank"
    And I should have 0 team_members

  @team_members-edit @edit
  Scenario: Edit Existing Team Member
    Given I have team_members titled "A name"
    When I go to the list of team_members
    And I follow "Edit this team_member" within ".actions"
    Then I fill in "Name" with "A different name"
    And I press "Save"
    Then I should see "'A different name' was successfully updated."
    And I should be on the list of team_members
    And I should not see "A name"

  @team_members-duplicate @duplicate
  Scenario: Create Duplicate Team Member
    Given I only have team_members titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of team_members
    And I follow "Add New Team Member"
    And I fill in "Name" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 team_members

  @team_members-delete @delete
  Scenario: Delete Team Member
    Given I only have team_members titled UniqueTitleOne
    When I go to the list of team_members
    And I follow "Remove this team member forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 team_members
 