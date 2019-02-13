@positive1
@accounts
Feature: Account acceptance test

  Scenario Outline: Create a new membership in an account only with an email.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":<email>
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data of membership

    Examples:
      |       email                         |
      | "maquinas_prueba123@hotmail.com"    |
      | "At08_est@yahoo.es"                 |
      | "team456@gmail.com" |
      | "pruebat_123@mailinator.com"        |

  @wip
  Scenario: Create a new membership in an account only with an email name uppercase.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    And I set up the data
      """
      {
      "email":"ROGER.alvarez@fundacion-jala.org"
      }
      """
    When I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data of membership

    @clear_account_memberships
    Scenario: Add a member in an account with an id, admin privileges but not create project privileges
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
        "person_id": 3143926,
        "project_creator": false,
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data of membership

  @clear_account_memberships
  Scenario: Add a member in an account with email, name, initials, admin privileges but not create project privileges
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
        "email": "NeatImp@mailinator.com",
        "name": "NeatImp",
        "initials": "NE",
        "project_creator": false,
        "admin": true
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data of membership
