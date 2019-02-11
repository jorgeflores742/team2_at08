@acceptance
Feature: Story

  @create_projects @create_story
  Scenario: Get story with id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema

  @create_projects @create_story
  Scenario: Put story with id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"accepted",
    "estimate":1,
    "description":"this is my description"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_projects @create_story
  Scenario: Delete story
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if the item was delete

