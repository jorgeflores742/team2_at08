@acceptance

Feature: Project Acceptance Test

  @create_projects
  Scenario: Get Projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema

  Scenario: Post an specified project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "New Project in acceptance test"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema

  @create_projects
  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/$PROJECT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema

  @create_projects
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

  @create_projects
  Scenario: Delete an specified project
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if the project was delete
