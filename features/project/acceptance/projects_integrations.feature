@acceptance
Feature: Integrations

  @create_projects
  Scenario: Get integrations with project_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/integrations" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_integrations" schema

  @create_projects
  Scenario: Post integrations with project_id
    Given I set up a "POST" request to "/projects/$PROJECT_ID/integrations" endpoint
    And I set up the data
    """
    {
    "api_username":"fakeuser",
    "api_password": "fakepassword",
    "filter_id": "474748",
    "base_url": "https://elrincondejira2.atlassianversion.net/page",
    "name": "hansSolo",
    "type": "jira"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_integrations" schema

  @create_projects @create_integration
  Scenario: Get integrations with project_id and integration_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/integrations/$INTEGRATION_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_integrations" schema


  @create_projects @create_integration
  Scenario: Put integrations with project_id and integration_id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/integrations/$INTEGRATION_ID" endpoint
    And I set up the data
    """
    {
    "base_url":"https://elrincondejiraoculto.atlassian.net",
    "name":"rinconcito"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_integrations" schema
    
