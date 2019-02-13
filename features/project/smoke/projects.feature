@smoke
Feature: Projects

  @create_projects
  Scenario: Get Project with project_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Get Projects
    Given I set up a "GET" request to "/projects" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Post an specified project
    Given I set up a "POST" request to "/projects" endpoint
    And I set up the data
    """
    {
      "name": "New project smoke unique"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Get projects with filter
    Given I set up a "GET" request to "/projects?account_ids=100" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Put Project with project_id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
    "name":"this project name to did modificated"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Delete Project with project_id
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
