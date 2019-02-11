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