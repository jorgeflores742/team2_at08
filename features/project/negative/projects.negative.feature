@negative
Feature: Change project start date


  @create_projects
  Scenario Outline: Change project start date from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "start_date": "<start_date>"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "iso_date" error schema
    Examples:
      | start_date |
      | 2019/02/04 |
      | 2019.02.04 |
      | 02/04/2019 |
      | 22/04/2025 |


  @create_projects
  Scenario Outline: Change project start date too far in the past from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "start_date": "<start_date>"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "too_far_past" error schema
    Examples:
      | start_date |
      | 2001-10-29 |
      | 1992-09-17 |
      | 2003-07-18 |
      | 2005-05-08 |


  @create_projects
  Scenario: Change project string long name from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "name": "Aliquam vitae congue ligula. Nunc porta velit dolor."
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "string_too_long" error schema


  @create_projects
  Scenario: Change project string long description from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mollis, ante ut accumsan scelerisque, tortor nunc vehicula nibh in dolor sit amet."
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "string_too_long" error schema


  @create_projects
  Scenario Outline: Update project iteration from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "iteration_length": <iteration_length>
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "iteration_length" error  schema
    Examples:
      | iteration_length  |
      | -1                |
      | 0                |
      | 5                |
      | -2                |
      | -5                |


#    And I verify the sent data
#
#
#  @create_projects
#  Scenario: Update project point scale from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "name": "Project point scale",
#      "point_scale": "0,2,4,6,8"
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data
#
#
#  @create_projects
#  Scenario Outline: Update project date time zone from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "start_date": "<start_date>",
#      "time_zone": {
#        "kind": "time_zone",
#        "offset": "<offset>",
#        "olson_name": "<olson_name>"
#      }
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data
#    Examples:
#      | start_date | offset | olson_name       |
#      | 2009-02-23 | +00:00 | Europe/London    |
#      | 2010-07-19 | +06:00 | Asia/Almaty      |
#      | 2022-10-17 | -04:00 | America/La_Paz   |
#
#
#  @create_projects
#  Scenario: Update project velocity from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "initial_velocity": 2,
#      "velocity_averaged_over": 3
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data
#
#
#  @create_projects
#  Scenario: Update project type from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "project_type": "shared"
#    }
#    """
#    When I send the request
#    Then I get a "200" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data
