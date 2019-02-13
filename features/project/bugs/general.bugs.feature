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