@smokee
@accounts
Feature: Account Memberships

  Scenario: List all of the memberships in an account.
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I send the request
    Then I get a "200" status code as response

  Scenario: Create a new membership in an account by email.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":"machine123@mailinator.com",
      "name":"machine123",
      "initials":"MA"
      }
      """
    When I send the request
    Then I get a "200" status code as response

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

  Scenario: Get an individual account membership, requested by the person_id.
    Given I set up a "GET" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    When I send the request
    Then I get a "200" status code as response

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

  Scenario: Delete the specified account membership.
    Given I set up a "DELETE" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    When I send the request
    Then I get a "204" status code as response
