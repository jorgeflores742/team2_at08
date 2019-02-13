@positive
Feature: post webhooks of Project

  @create_projects
  Scenario Outline: Post webhooks an specified project with  person_id
    Given I set up a "POST" request to "/projects/$PROJECT_ID/webhooks" endpoint
    And I set up the data
    """
    {
      "webhook_url": "<webhook_url>",
      "webhook_version": "<webhook_version>"
    }
    """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Project_webhooks" schema
    And I verify the sent data

    Examples:
      | webhook_url              | webhook_version |
      | https://www.gmail.com    | v5              |
      | https://www.skype.com    | v5              |
      | https://www.trello.com   | v5              |
