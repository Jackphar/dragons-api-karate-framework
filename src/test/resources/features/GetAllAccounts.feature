@Regression
Feature: Get All Accounts

  Background: URL Setup
    Background: Setup url and token

    * def result = callonce read('GenerateToken.feature')
    * def token = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Get All Accounts
    And path "/api/accounts/get-all-accounts"
    And header Authorization = "Bearer " + token
    When method get
    Then status 200
    And print response
   
