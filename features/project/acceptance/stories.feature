@acceptance
Feature: Get stories

  @create_projects @create_story
  Scenario: Get All stories
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories?limit=1&with_state=unscheduled" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story GET" schema

  @create_projects
  Scenario: Post new stories
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":"Story of acceptance"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story POST" schema
    And I verify the sent data


  @create_projects
  Scenario: Post new stories with parameters
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"accepted",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story POST" schema
    And I verify the sent data

  @create_projects @create_story
  Scenario: Get story with id parameter
    Given I set up a "GET" request to "/projects/$PROJECT_ID/stories/bulk?ids=$STORY_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story GET" schema
