@smoke
Feature: Get stories

  @create_projects @create_story
  Scenario: Get All stories
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories?date_format=millis&with_state=unscheduled" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Post new stories
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":"Storie created by team2"
      }
      """
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Post new stories with parameters
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"accepted",
      "estimate":1,
      "name":"Exhaust ports are ray shielded 👹"}
      """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Get story with id parameter
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories/bulk?ids=$STORY_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
