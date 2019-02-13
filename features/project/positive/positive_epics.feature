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

  @create_projects
  Scenario: Create a new epic with label name as emoji
    Given I set up a "POST" request to "/projects/$PROJECT_ID/epics" endpoint
    And I set up the data
    """
    {
      "name":"Epicitive",
      "label":{"name":"unique name"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics

    @create_projects
    Scenario: Create a new epic with description and label
    Given I set up a "POST" request to "/projects/$PROJECT_ID/epics" endpoint
    And I set up the data
    """
    {
      "name":"Epic positive man",
      "description":"This is a description",
      "label":{"name":"label only in lowercase"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics