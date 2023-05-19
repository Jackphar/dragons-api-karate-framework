@Smoke @Regression
Feature: API Test Security Section

  Background: Setup URL
    Given url "https://tek-insurance-api.azurewebsites.net"
    And path "/api/token"

  Scenario: Create token with valid username and password
    And request {"username": "supervisor", "password": "tek_supervisor"}
    When method post
    Then status 200
    And print response

  #Scenario 1:
  #endpoint = /api/token
  #if you send wrong username you should get 400 Status code
  #And API Response errorMessage "User not found"
  Scenario: Validate token with invalid username
    And request {"username": "wrongUsername", "password": "tek_supervisor"}
    When method post
    Then status 400
    And print response
    And assert response.errorCode == "USER_NOT_FOUND"

  #Scenario 2:
  #endpoint = /api/token
  #if you send correct username and wrong password,
  #you should see 400 Bad Request and errorMessage "Password Not Matched"
  #And "httpStatus": "BAD_REQUEST",
  Scenario: Validate token with invalid password
    And request {"username": "supervisor", "password": "wrongPassword"}
    When method post
    Then status 400
    And print response
    And assert response.errorMessage == "Password Not Matched"
    And assert response.httpStatus == "BAD_REQUEST"
