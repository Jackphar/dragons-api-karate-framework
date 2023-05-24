#Scenario 10:
#Endpoint = /api/accounts/add-primary-account.
#Status Code = 201
#Assert email address
#Notes:
#duplicate email not accepted
#For Gender and maritalStatus You have to use the Predefined values.
#Once you create Account validate database and take screenshot.
#FirstName and LastName should be your name.
#In Request body we don't need id and isNew field (you can remove them).
Feature: Create account test

  Background: Setup url and token
    # callonce read is Karate step to execute and read another feature file.
    # the result of callonce read can store into new variable -token- in the following example using def.
    * def result = callonce read('GenerateToken.feature')
    * def token = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"
    

  Scenario: Create account test
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + token
    Then request
      """
      {
      "email": "someoneRohJa@gmail.com",
      "firstName": "Rohullah",
      "lastName": "Jackphar",
      "title": "Mr.",
      "gender": "MALE",
      "maritalStatus": "MARRIED",
      "employmentStatus": "Unemployed",
      "dateOfBirth": "1989-05-11",
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.email == "someoneRohJa@gmail.com"
    # delete the above account
    Given path "/api/accounts/delete-account"
    And param primaryPersonId = response.id
    And header Authorization = "Bearer " + token
    When method delete
    And status 200
    And print response
    And assert response == "Account Successfully deleted"
