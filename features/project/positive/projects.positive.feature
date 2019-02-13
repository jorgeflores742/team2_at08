@positive
Feature: Change project start date

  @create_projects
  Scenario: Change project start date from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "name": "Verify changing name",
      "start_date": "2019-02-04"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_projects
  Scenario: Change project name from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "name": "Aliquam vitae congue ligula. Nunc porta velit dol."
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_projects
  Scenario: Change project description from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mollis, ante ut accumsan scelerisque, tortor nunc vehicula nibh in dolor."
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data


  @create_projects
  Scenario: Update project iteration from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "iteration_length": 1
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

  @create_projects
  Scenario: Update project point scale from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "name": "Project point scale",
      "point_scale": "0,2,4,6,8"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data


  @create_projects
  Scenario Outline: Update project date time zone from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "start_date": "<start_date>",
      "time_zone": {
        "kind": "time_zone",
        "offset": "<offset>",
        "olson_name": "<olson_name>"
      }
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data
    Examples:
      | start_date | offset | olson_name       |
      | 2009-02-23 | +00:00 | Europe/London    |
      | 2010-07-19 | +06:00 | Asia/Almaty      |
      | 2022-10-17 | -04:00 | America/La_Paz   |

  @create_projects
  Scenario Outline: Update project week start day
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "project_type": "<project_type>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data
    Examples:
      |project_type|
      | demo    |
      | private |
      | public  |
      | shared  |

  @create_projects
  Scenario Outline: Update project week start day
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "join_as": "<join_as>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    Examples:
      |join_as|
      | owner |
      | member|
      | viewer|

  @create_projects
  Scenario: Update project velocity from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "initial_velocity": 2,
      "velocity_averaged_over": 3
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data


  @create_projects
  Scenario: Update project type from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "profile_content": "this project is a test"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data

    @create_projects
    Scenario: Update project boolean
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "bugs_and_chores_are_estimatable": false,
      "automatic_planning": false,
      "enable_tasks": false
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project" schema
    And I verify the sent data