@smoke
Feature: Story Transitions

  @create_projects @create_story
  Scenario: Get Story transitions
    Given I set up a "GET" request to "/projects/$PROJECT_ID/story_transitions" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_story
  Scenario: Get Story transitions csv
    Given I set up a "GET" request to "/projects/$PROJECT_ID/story_transitions.csv" endpoint
    When I send the request
    Then I get a "200" status code as response
