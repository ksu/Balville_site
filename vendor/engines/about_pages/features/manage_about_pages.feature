@about_pages
Feature: About Pages
  In order to have about_pages on my website
  As an administrator
  I want to manage about_pages

  Background:
    Given I am a logged in refinery user
    And I have no about_pages

  @about_pages-list @list
  Scenario: About Pages List
   Given I have about_pages titled UniqueTitleOne, UniqueTitleTwo
   When I go to the list of about_pages
   Then I should see "UniqueTitleOne"
   And I should see "UniqueTitleTwo"

  @about_pages-valid @valid
  Scenario: Create Valid About Page
    When I go to the list of about_pages
    And I follow "Add New About Page"
    And I fill in "Title" with "This is a test of the first string field"
    And I press "Save"
    Then I should see "'This is a test of the first string field' was successfully added."
    And I should have 1 about_page

  @about_pages-invalid @invalid
  Scenario: Create Invalid About Page (without title)
    When I go to the list of about_pages
    And I follow "Add New About Page"
    And I press "Save"
    Then I should see "Title can't be blank"
    And I should have 0 about_pages

  @about_pages-edit @edit
  Scenario: Edit Existing About Page
    Given I have about_pages titled "A title"
    When I go to the list of about_pages
    And I follow "Edit this about_page" within ".actions"
    Then I fill in "Title" with "A different title"
    And I press "Save"
    Then I should see "'A different title' was successfully updated."
    And I should be on the list of about_pages
    And I should not see "A title"

  @about_pages-duplicate @duplicate
  Scenario: Create Duplicate About Page
    Given I only have about_pages titled UniqueTitleOne, UniqueTitleTwo
    When I go to the list of about_pages
    And I follow "Add New About Page"
    And I fill in "Title" with "UniqueTitleTwo"
    And I press "Save"
    Then I should see "There were problems"
    And I should have 2 about_pages

  @about_pages-delete @delete
  Scenario: Delete About Page
    Given I only have about_pages titled UniqueTitleOne
    When I go to the list of about_pages
    And I follow "Remove this about page forever"
    Then I should see "'UniqueTitleOne' was successfully removed."
    And I should have 0 about_pages
 