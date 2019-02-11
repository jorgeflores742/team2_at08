@positive
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
    And I verify the sent data membership

    Examples:
      |       email                         |
      | "maquinas_prueba123@hotmail.com"    |
      | "At08_est@yahoo.es"                 |
      | "roger.alvarez@fundacion-jala.org"  |
      | "pruebat_123@mailinator.com"        |
