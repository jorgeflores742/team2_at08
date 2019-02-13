@positive
Feature: Positive test of Epic feature

  @create_projects @create_epic
  Scenario: Update epic name label description
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    And I set up the data
    """
    {
      "name": "Name epic",
      "description": "This is a description"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics

  @create_projects @create_epic
  Scenario: Update epic new name and description
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    And I set up the data
    """
    {
      "name": "epico",
      "description": "here description"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data

  @create_projects @create_epic
  Scenario: Update epic label
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    And I set up the data
    """
    {
      "label":{"name":"good morning"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics