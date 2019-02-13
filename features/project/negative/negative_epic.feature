@negative
Feature: Positive test of Epic feature

  @create_projects @create_epic
  Scenario: Create epic with a same name
    Given I set up a "POST" request to "/projects/$PROJECT_ID/epics/" endpoint
    And I set up "$EPIC_NAME" the data
    """
    {
      "name": "$EPIC_NAME"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "resource_no_found" error schema