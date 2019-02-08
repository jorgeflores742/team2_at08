@smoke
@accounts
Feature: Get account

  Scenario: Get all Accounts
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Get Account
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
