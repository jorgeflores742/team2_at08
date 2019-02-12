@negative
Feature: Get stories


  @create_projects
  Scenario: Post new stories with name number
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":911
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema

  @create_projects
  Scenario: Post new stories with name empty
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":"  "
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema

  @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to desconocido
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"desconocido",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema

  @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to number
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":4895,
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema

  @create_projects
  Scenario Outline: Post new stories with parameters accepted_at and deadline
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "story_type":"release",
      "current_state":"accepted",
      "accepted_at":<accepted_at>,
      "name":"other_world",
      "deadline":<deadline>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema
    Examples:
      |  accepted_at            |     deadline          |
      |  "2019-04-30"           | "2019-02-05"          |
      |  "2020-02-05T12:00:00Z" | "2019-02-05T12:00:00Z"|
      |  2067296015000          | 2167296015000         |
