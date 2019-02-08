@smoke
Feature: Epic feature

  @create_projects
  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/$PROJECT_ID/epics" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Create a new epic
    Given I set up a "POST" request to "/projects/$PROJECT_ID/epics" endpoint
    And I set up the data
    """
    {
      "name":"epicking"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_epic
  Scenario: Get an specific epic
    Given I set up a "GET" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_epic
  Scenario: Update an specific epic
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    And I set up the data
    """
    {
      "description": "New epic test description"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects @create_epic
  Scenario: Delete an specific epic
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
