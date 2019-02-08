@acceptance
Feature: Acceptance test of Epic feature

  @create_projects @create_epic
  Scenario: Update epic name label description
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    And I set up the data
    """
    {
      "name": "Name epic",
      "description": "This is a description",
      "label":{"name":"name label"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema

  @create_projects @create_epic
  Scenario: Delete the specified epic
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
