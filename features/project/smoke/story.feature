@smoke
Feature: Story

  @create_projects @create_story
  Scenario: Get story with id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Put story with id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
      "labels":
      [
        {"name":"new name"}
      ]
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Put story with id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"started",
    "estimate":1
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Delete story
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
