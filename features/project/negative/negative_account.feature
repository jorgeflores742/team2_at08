@negative
@accounts
Feature: Account negative test

  Scenario: Get an account invalid
    Given I set up a "GET" request to "/accounts/string" endpoint
    When I send the request
    Then I get a "404" status code as response
    And I validate with "resource_no_found" error schema

  Scenario: Create an existing membership in an account.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":"testa_team2a@hotmail.com"
      }
      """
    And I send the request
    And I set up the data
      """
      {
      "email":"testa_team2a@hotmail.com"
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema
    And I verify the "Member already exists." problem message in error schema

  Scenario Outline: Create a new membership in an account with an invalid email.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":<email>
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

    Examples:
      |       email                         |
      | "maquinas_prueba123hotmail.com"     |
      | "At08_est@yahooes"                  |
      | "t123456"                           |

  Scenario: Create a new membership in an account with a email white.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":" "
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

  Scenario: Create a new membership in an account with a name and initials whites.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":" ",
      "name":" ",
      "initials": " "
      }
      """
    When I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

  Scenario: Add a member in an account with a name whit 101 characters.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
      "email":"team_testat08t25@mailinator.com",
      "name":"The Imperium of Man is a galaxy-spanning human empire, the ultimate authority finish in the terra 135",
      "initials":"AD"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

  Scenario: Add a member in an account with a name whit 101 characters.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
      "email":"team_testat08t25@mailinator.com",
      "name":"The Imperium of Man is a galaxy-spanning human empire, the ultimate authority finish in the terra 135",
      "initials":"AD"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

  Scenario: Add a member in an account with a string in person_id.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
      "person_id":"test"
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

  Scenario: Add a member in an account with a person_id white.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
      "person_id":" "
      }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema

  Scenario: Add a member in an account with a body white.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      { }
    """
    And I send the request
    Then I get a "400" status code as response
    And I validate with "Invalid_parameter" error schema
