@negative
Feature: Get stories


  @create_projects
  Scenario: Post new stories with 1 characters of name-1
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":911
      }
      """
    When I send the request
    Then I get a "400" status code as response

  @create_projects
  Scenario: Post new stories with 5000 characters of name0
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "name":"  "
      }
      """
    When I send the request
    Then I get a "400" status code as response

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