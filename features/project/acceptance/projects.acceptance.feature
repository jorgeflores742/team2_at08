@acceptance

Feature: Project Acceptance Test

  @create_projects
  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/$PROJECT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    
