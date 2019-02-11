@positive
Feature: Story

  @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type combination 1
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"delivered",
    "story_type": "bug"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type combination 2
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"unstarted",
    "story_type": "chore"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data


    @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type combination 3
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"rejected",
    "story_type": "bug"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type combination 4
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"accepted",
    "story_type": "release"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data


    @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type combination 5
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"started",
    "story_type": "chore"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data

  @create_projects @create_story
  Scenario: Put story with parameters current_state and story_type combination 6
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"accepted",
    "story_type": "release"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data