@vacancies
Feature: Vacancies
  In order to have vacancies on my website
  As an administrator
  I want to manage vacancies

  Background:
    Given I am a logged in refinery user
    And I have no vacancies

  @vacancies-list @list
  Scenario: Vacancies List
   Given I have vacancies titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of vacancies
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @vacancies-valid @valid
  Scenario: Create Valid Vacancy
    When I go to the list of vacancies
    And I follow "Add New Vacancy"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 vacancy

  @vacancies-invalid @invalid
  Scenario: Create Invalid Vacancy (without title)
    When I go to the list of vacancies
    And I follow "Add New Vacancy"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 vacancies

  @vacancies-edit @edit
  Scenario: Edit Existing Vacancy
    Given I have vacancies titled "A title"
    When I go to the list of vacancies
    And I follow "Edit this vacancy" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of vacancies
    And I should not see "A title"

  @vacancies-duplicate @duplicate
  Scenario: Create Duplicate Vacancy
    Given I only have vacancies titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of vacancies
    And I follow "Add New Vacancy"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 vacancies

  @vacancies-delete @delete
  Scenario: Delete Vacancy
    Given I only have vacancies titled UniqueTitleOne
    When I go to the list of vacancies
    And I follow "Remove this vacancy forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 vacancies
 