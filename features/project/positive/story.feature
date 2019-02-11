@positive
Feature: Story

  @create_projects @create_story
  Scenario Outline: Put story with parameters current_state and story_type combination 1
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/stories/$STORY_ID" endpoint
    And I set up the data
    """
    {
    "current_state":"<current_state>",
    "story_type": "<story_type>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Story" schema
    And I verify the sent data
    Examples:
      |  current_state  | story_type |
      |  delivered      | bug |
      |  unstarted      | bug |
      |  rejected       | bug |
      |  started        | bug |
      |  finished       | bug |
      |  planned        | bug |
      |  unscheduled    | bug |
      |  unstarted      | feature |
      |  planned        | feature |
      |  unscheduled    | feature |
      |  unstarted      | chore |
      |  started        | chore |
      |  planned        | chore |
      |  unscheduled    | chore |
      |  unstarted      | release |
      |  planned        | release |
      |  unscheduled    | release |

