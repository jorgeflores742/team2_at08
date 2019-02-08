@smoke
Feature: Story task.

  @create_projects @create_story
  Scenario: Get tasks
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Post a task
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    And I set up the data
    """
      {
      "description": "Task first"
      }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Post a task other
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    And I set up the data
    """
      {
      "complete":true,
      "description":"Task other",
      "position":1}
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story @create_task
  Scenario: Get task with id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks/$TASK_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story @create_task
  Scenario: Put an task with id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks/$TASK_ID" endpoint
    And I set up the data
    """
      {
      "complete":true,
      "position":1
      }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story @create_task
  Scenario: Delete an task
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks/$TASK_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
