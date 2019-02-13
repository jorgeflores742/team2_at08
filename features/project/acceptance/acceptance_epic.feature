@acceptance
Feature: acceptance test of Epic feature

  @create_projects
  Scenario: Get an specified project
    Given I set up a "GET" request to "/projects/$PROJECT_ID/epics" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema

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
    And I validate with "Epic" schema
    And I verify the sent data

  @create_projects @create_epic
  Scenario: Get an specific epic
    Given I set up a "GET" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema

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
    And I validate with "Epic" schema
    And I verify the sent data

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
    And I verify the sent data

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
  Scenario: PUT epic label
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/epics/$EPIC_ID" endpoint
    And I set up the data
    """
    {
      "label":{"name":"hello"}
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Epic" schema
    And I verify the sent data of epics