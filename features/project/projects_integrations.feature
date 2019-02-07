@smoke @create_project
Feature: Integrations

  Scenario: Get integrations with project_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/integrations" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_project
  Scenario: Post integrations with project_id
    Given I set up a "POST" request to "/projects/$PROJECT_ID/integrations" endpoint
    And I set up the data
    """
    {
    "api_username":"fakeuser",
    "api_password": "fakepassword",
    "filter_id": "474748",
    "base_url": "https://elrincondejira2.atlassianversion.net/dateTime",
    "name": "hansSolo",
    "type": "jira"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_integration
  Scenario: Get integrations with project_id and integration_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/integrations/$INTEGRATION_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_integration
  Scenario: Delete integrations with project_id and integration_id
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/integrations/$INTEGRATION_ID" endpoint
    When I send the request
    Then I get a "204" status code as response

  @create_integration
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
    
