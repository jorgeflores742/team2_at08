@positive
Feature: Story task.

  @create_projects @create_story
  Scenario: Post a task with description and complete
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    And I set up the data
    """
      {
      "description": "Task first",
      "complete":false
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data

  @create_projects @create_story
  Scenario: Post a task with description, complete and position
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks" endpoint
    And I set up the data
    """
      {
      "complete":true,
      "description":"Task second",
      "position":1
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data


  @create_projects @create_story @create_task @create_task
  Scenario: Put an task to other position
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID/tasks/$TASK_ID" endpoint
    And I set up the data
    """
      {
      "complete":true,
      "description":"this task be complete",
      "position":1
      }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Task" schema
    And I verify the sent data
