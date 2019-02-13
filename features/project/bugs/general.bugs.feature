@positive
@wip
Feature: Bugs candidates

  @create_projects
  Scenario: Update project date time zone from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "start_date": "2009-02-23",
      "time_zone": {
        "kind": "time_zone",
        "offset": "+00:00",
        "olson_name": "Europe"
      }
    }
    """
    When I send the request
    Then I get a "400" status code as response

  Scenario: Update different project TZ from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "start_date": "2009-11-30",
      "time_zone": {
        "olson_name": "America/La Paz"
      }
    }
    """
    When I send the request
    Then I get a "400" status code as response

  @create_projects
  Scenario Outline: Update project week start day
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "week_start_day": "<days>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    Examples:
      | days      |
      | Sunday    |
      | Monday    |
      | Tuesday   |
      | Wednesday |
      | Friday    |
      | Saturday  |

  Scenario: Create a new membership in an account only with an email name uppercase.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":"ROGER.alvarez@fundacion-jala.org"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data membership

  @create_projects
  Scenario: Update project week start day
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "project_type": "shared"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data