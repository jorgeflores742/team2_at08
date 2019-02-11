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
  Scenario: Post new stories with parameters with name, description, estimate and current state like to accepted
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"accepted",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data

    @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to delivered
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"delivered",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data


    @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to finished
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"finished",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data

    @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to started
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"started",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data

    @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to rejected
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"rejected",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data


  @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to unstarted
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"unstarted",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data


  @create_projects
  Scenario: Post new stories with parameters with name, description, estimate and current state like to unscheduled
    Given I set up a "POST" request to "/projects/$PROJECT_ID/stories" endpoint
    And I set up the data
      """
      {
      "current_state":"unscheduled",
      "estimate":1,
      "name":"Exhaust ports are ray shielded👹",
      "description":"this is my description"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story_parameters" schema
    And I verify the sent data