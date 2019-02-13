@positive
@accounts
Feature: Account positive test

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
      | "team456@gmail.com" |
      | "pruebat_123@mailinator.com"        |

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


  Scenario: Add a member in an account with a name whit 100 characters.
    Given I set up a "POST" request to "/accounts/$ACCOUNT_ID/memberships" endpoint
    When I set up the data
    """
      {
      "email":"team_testat08t2@mailinator.com",
      "name":"The Imperium of Man is a galaxy-spanning human empire, the ultimate authority finish in the terra 13",
      "initials":"AD"
      }
    """
    And I send the request
    Then I get a "200" status code as response
    And I validate with "Account_membership_create" schema
    And I verify the sent data of membership

  @create_membership_in_an_account @clear_account_memberships
  Scenario: Updates the admin status in a specified account membership.
    Given I set up a "PUT" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    And I set up the data
      """
      {
      "admin": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    Then I validate with "Account_membership_create" schema
    And I verify the sent data

  @create_membership_in_an_account @clear_account_memberships
  Scenario: Updates the project_creator status in a specified account membership.
    Given I set up a "PUT" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    And I set up the data
      """
      {
      "project_creator": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    Then I validate with "Account_membership_create" schema
    And I verify the sent data

  @create_membership_in_an_account @clear_account_memberships
  Scenario: Updates the time_enterer status in a specified account membership.
    Given I set up a "PUT" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    And I set up the data
      """
      {
      "time_enterer": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    Then I validate with "Account_membership_create" schema
    And I verify the sent data

  @create_membership_in_an_account @clear_account_memberships
  Scenario: Updates the timekeeper status in a specified account membership.
    Given I set up a "PUT" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    And I set up the data
      """
      {
      "timekeeper": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    Then I validate with "Account_membership_create" schema
    And I verify the sent data

  @create_membership_in_an_account @clear_account_memberships
  Scenario: Updates the all parameters in a specified account membership.
    Given I set up a "PUT" request to "/accounts/$ACCOUNT_ID/memberships/$MEMBERSHIP_ID_FOR_ACCOUNT" endpoint
    And I set up the data
      """
      {
      "admin": true,
      "project_creator": true,
      "time_enterer": true,
      "timekeeper": true
      }
      """
    When I send the request
    Then I get a "200" status code as response
    Then I validate with "Account_membership_create" schema
    And I verify the sent data
