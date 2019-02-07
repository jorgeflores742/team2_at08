@smoke
@create_project
Feature: Epic feature

  @create_epic
  Scenario: Get an specific epic
    Given I set up a "GET" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_epic
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

  @create_epic
  Scenario: Delete an specific epic
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
