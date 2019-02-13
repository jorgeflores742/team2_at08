@positive
Feature: Get memberships of Project

  @create_projects
  Scenario Outline: Post memberships an specified project with  person_id
    Given I set up a "POST" request to "/projects/$PROJECT_ID/memberships" endpoint
    And I set up the data
    """
    {
      "person_id": <person_id>,
      "role": "<role>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_membership" schema
    And I verify the sent data of membership
    Examples:
      | person_id | role   |
      | 3143772   | member |
      | 3143772   | owner  |
      | 3143772   | viewer |


  @create_projects
  Scenario Outline: Post memberships an specified project with email
    Given I set up a "POST" request to "/projects/$PROJECT_ID/memberships" endpoint
    And I set up the data
    """
    {
      "email": "<email>",
      "role": "<role>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_membership" schema
    And I verify the sent data of membership
    Examples:
      | email                    | role   |
      | team2at08@mailinator.com | member |
      | team2at08@mailinator.com | owner  |
      | team2at08@mailinator.com | viewer |