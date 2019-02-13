@acceptance
Feature: Return a set of iterations from the project. (Paginated)

  @create_projects
  Scenario: Successful responses to this request return an array containing zero or more instances of the iteration
  resource.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/iterations" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_interations" schema

  @create_projects
  Scenario: Successful responses to this request return the iteration resource.
    Given I set up a "GET" request to "/projects/$PROJECT_ID/iterations/1" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_interations" schema
