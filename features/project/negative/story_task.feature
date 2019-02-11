@negative
Feature: Story task.

  @create_projects @create_story
  Scenario: Post a task with description like to number and complete like to string
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    And I set up the data
    """
      {
      "description": 123456,
      "complete":"final"
      }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_projects @create_story
  Scenario: Post a task with description, complete and position that not is available
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    And I set up the data
    """
      {
      "complete":true,
      "description":"Task second",
      "position":20
      }
    """
    When I send the request
    Then I get a "400" status code as response


  @create_projects @create_story @create_task @create_task
  Scenario: Put an task to other position like to null
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks/$TASK_ID" endpoint
    And I set up the data
    """
      {
      "complete":true,
      "description":"this task be complete",
      "position":null
      }
    """
    When I send the request
    Then I get a "400" status code as response

