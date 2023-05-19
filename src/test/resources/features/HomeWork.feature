@Regression
Feature: Get Account API

  #Scenario 9:
  #Endpoint = /api/accounts/get-account
  #For primaryPersonId = 6639
  #Make sure email address is "ChristinNikolaus@tekschool.us"
  Background: URL Setup
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    * def generatedToken = response.token

  Scenario: Get Account
    And path "/api/accounts/get-account"
    And param primaryPersonId = 6639
    And header Authorization = "Bearer " + generatedToken
    When method get
    Then status 200
    And print response
    And assert response.primaryPerson.firstName == "Kasey"
    And assert response.primaryPerson.email == "ChristinNikolaus@tekschool.us"
