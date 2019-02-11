@positive
Feature: Get stories


  @create_projects
  Scenario: Post new stories with only name
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":"Exhaust ports are ray shielded"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_projects
  Scenario Outline: Post new stories with parameters with name, description, estimate and current state like to datatable
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"<current_state>",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data
    Examples:
      |  current_state  |
      |  accepted       |
      |  delivered      |
      |  finished       |
      |  started        |
      |  rejected       |
      |  unstarted      |
      |  unscheduled    |
      |  planned        |
