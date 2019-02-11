@negative
Feature: Change project start date

#  @create_projects
#  Scenario: Change project start date from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "start_date": "2019-02-14"
#    }
#    """
#    When I send the request
#    Then I get a "400" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data

  @create_projects
  Scenario: Change project name from GET specified project
    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
    And I set up the data
    """
    {
      "name": "Aliquam vitae congue ligula. Nunc porta velit dolor."
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Project" schema
    And I verify the sent data
#
#  @create_projects
#  Scenario: Change project description from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus mollis, ante ut accumsan scelerisque, tortor nunc vehicula nibh in dolor sit amet."
#    }
#    """
#    When I send the request
#    Then I get a "400" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data
#
#  @create_projects
#  Scenario: Change custom point scale from GET specified project
#    Given I set up a "PUT" request to "/projects/$PROJECT_ID" endpoint
#    And I set up the data
#    """
#    {
#      "point_scale_is_custom": true,
#      "point_scale": "33-66-99"
#    }
#    """
#    When I send the request
#    Then I get a "400" status code as response
#    And I validate with "Project" schema
#    And I verify the sent data