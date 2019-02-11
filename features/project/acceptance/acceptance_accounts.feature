@acceptance
@accounts
Feature: Account acceptance test

  Scenario: Get all Accounts
    Given I set up a "GET" request to "/accounts" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Accounts" schema

  Scenario: Get an account
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account" schema

  Scenario: Get Account summaries
    Given I set up a "GET" request to "/account_summaries?with_permission=project_creation" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_summaries" schema

  Scenario: List all of the memberships in an account.
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership" schema

  Scenario: Create a new membership in an account by email.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":"team2at@mailinator.com",
      "name":"team2",
      "initials":"at08"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data membership

  Scenario: Create a new membership in an account by ID
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "person_id":3143772
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data membership


  Scenario: Get an individual account membership, requested by the person_id.
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema

  Scenario: Updates the specified account membership.
    Given I set up a "PUT" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    And I set up the data
      """
      {
      "project_creator":true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    Then I validate with "Account_membership_create" schema
    And I verify the sent data

  Scenario: Delete the specified account membership.
    Given I set up a "DELETE" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    When I send the request
    Then I get a "204" status code as response
    And I verify if the item was delete
    And I validate with "Error unfound resource" schema
