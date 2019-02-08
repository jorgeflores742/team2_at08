@acceptance
@accounts
Feature: Account acceptance test

  @read_account
  Scenario: Get an account
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account" schema
