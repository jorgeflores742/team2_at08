@negative
Feature: Story

  @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type like to parameter no stabled
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"delivered",
    "story_type": "buger"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema

  @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type like to number
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"unstarted",
    "story_type": 154
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema


    @create_projects @create_story
  Scenario: Put story with parameters current_state like to number and story_type
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":789,
    "story_type": "bug"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema

  @create_projects @create_story
  Scenario Outline: Put story with parameters current_state and story_type combinations
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"<current_state>",
    "story_type": "<story_type>"
    }
    """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Error unfound resource" schema
    Examples:
      |  current_state  | story_type |
      |  delivered      | feature |
      |  rejected       | feature |
      |  accepted       | feature |
      |  started        | feature |
      |  accepted       | feature |
      |  finished       | feature |
      |  delivered      | chore |
      |  rejected       | chore |
      |  finished       | chore |
      |  delivered      | release |
      |  rejected       | release |
      |  started        | release |
      |  finished       | release |
