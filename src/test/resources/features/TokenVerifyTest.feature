@Smoke @Regression
Feature: Token Verify Test

  Background: Setup url
    Given url "https://tek-insurance-api.azurewebsites.net"

  #Scenario 5:
  #endpoint = /api/token/verify
  #With a valid token you should get response HTTP Status Code 200 and response true
  Scenario: Verify valid token
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "supervisor"
    When method get
    Then status 200
    And print response
    And assert response == "true"

  #Scenario 6:
  #Endpoint = /api/token/verify
  #Wrong username should send as parameter
  #response HTTP Status Code 400
  #and error message "Wrong Username send along with Token"
  Scenario: Negative test validate token verify with wrong username
    And path "/api/token"
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response
    Given path "/api/token/verify"
    And param token = response.token
    And param username = "wrongUsername"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Wrong Username send along with Token"

  #Scenario 7:
  #Endpoint = /api/token/verify
  #with invalid token and valid username should have
  #Status code 400 and error Message "Token Expired or Invalid Token"
  Scenario: Negative test verify token with invalid token and valid username
    Given path "/api/token/verify"
    And param token = "invalidtoken"
    And param username = "supervisor"
    When method get
    Then status 400
    And print response
    And assert response.errorMessage == "Token Expired or Invalid Token"
