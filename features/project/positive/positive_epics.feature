@positive
Feature: Positive test of Epic feature

  @create_projects
  Scenario: Create epic with a specific name and description
    Given I set up a "POST" request to "/projects/$PROJECT_ID/epics/" endpoint
    And I set up the data
    """
    {
      "name": "Name epic test",
      "description":"Description for this epic."
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics

