@acceptance
@create_project
Feature: Project Acceptance Test

  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/$PROJECT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema

  Scenario: Put an specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "name": "Test data"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data
