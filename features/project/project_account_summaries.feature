Feature: Get account

  Scenario: Get Account
    Given I set up a "GET" request to "/account_summaries?with_permission=project_creation" endpoint
    When I send the request
    Then I get a "200" status code as response

    