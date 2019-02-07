@smoke
Feature: webhooks

  @create_projects
  Scenario: Get webhooks
    Given I set up a "GET" request to "/projects/$PROJECT_ID/webhooks" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  Scenario: Post webhooks
    Given I set up a "POST" request to "/projects/$PROJECT_ID/webhooks" endpoint
    And I set up the data
      """
      {
      "webhook_url":"https://lapelicula2468.com",
      "webhook_version":"v5"
      }
      """
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  @create_webhook
  Scenario: Get webhooks with webhooks_id
    Given I set up a "GET" request to "/projects/$PROJECT_ID/webhooks/$WEBHOOK_ID" endpoint
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  @create_webhook
  Scenario: Put webhooks with id
    Given I set up a "PUT" request to "/projects/$PROJECT_ID/webhooks/$WEBHOOK_ID" endpoint
    And I set up the data
      """
      {
      "webhook_url":"https://mywebhooks2.com"
      }
      """
    When I send the request
    Then I get a "200" status code as response

  @create_projects
  @create_webhook
  Scenario: Delete webhooks with id
    Given I set up a "DELETE" request to "/projects/$PROJECT_ID/webhooks/$WEBHOOK_ID" endpoint
    When I send the request
    Then I get a "204" status code as response
