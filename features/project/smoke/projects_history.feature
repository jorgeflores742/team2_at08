@smoke
Feature: Returns per day information of story points and counts by state. If no start date or end date is provided, the
  project's most recent history is returned.

  @create_projects
  Scenario: Get the daily history of story points and counts by state.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/history/days" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Returns a list of project snapshots. By default, data for the last 7 days is returned.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/history/snapshots" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Get the iteration's daily history of story points and counts by state.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/history/iterations/1/days" endpoint
    When I send the request
    Then I get a "200" status code as response

