@create_project
Feature: Return a set of iterations from the project. (Paginated)

  Scenario: Successful responses to this request return an array containing zero or more instances of the iteration
  resource.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/iterations" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Successful responses to this request return the iteration resource.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/iterations/1" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Successful responses to this request return the analytics resource.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/iterations/1/analytics" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Gets cycle time details for the stories in the specified iteration. The iteration must fall entirely within
  the last six months.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/iterations/1/analytics/cycle_time_details" endpoint
    When I send the request
    Then I get a "200" status code as response

