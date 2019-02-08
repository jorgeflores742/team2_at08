@smoke
Feature: Get account

  @create_projects
  Scenario: Post memberships with project_id
    Given I set up a "POST" request to "/projects/$PROJECT_ID/memberships" endpoint
    And I set up the data
    """
    {
    "person_id":106,
    "role":"member"
    }
    """
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Get memberships with project_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  @create_membership
  Scenario: Get memberships with project_id and membership_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/memberships/$MEMBERSHIP_ID_FOR_PROJECT" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  @create_membership
  Scenario: Delete memberships with project_id and membership_id
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/memberships/$MEMBERSHIP_ID_FOR_PROJECT" endpoint
    When I send the request
    Then I get a "204" status code as response

  @create_projects
  @create_membership
  Scenario: Put memberships with project_id and membership_id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/memberships/$MEMBERSHIP_ID_FOR_PROJECT" endpoint
    And I set up the data
    """
    {
    "role":"viewer"
    }
    """
    When I send the request
    Then I get a "200" status code as response
