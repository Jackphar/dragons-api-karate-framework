#End 2 End Account Testing
#Create Account
#Add Address
#Add Phone
#Add Car
#Get Account
@Regression
Feature: Create a complete account

  Background: Setup url and token
    * def result = callonce read('GenerateToken.feature')
    * def token = result.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"
    * def dataGenerator = Java.type('api.data.GenerateData')
    * def rondomEmail = dataGenerator.getEmail()

  Scenario: Create end to end account
    Given path "/api/accounts/add-primary-account"
    And header Authorization = "Bearer " + token
    And request
      """
      {
      "email": "#(rondomEmail)",
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
    * def id = response.id
    And assert response.email == rondomEmail
    #Add address
    Given path "/api/accounts/add-account-address"
    And param primaryPersonId = id
    And header Authorization = "Bearer " + token
    Then request
      """
      {
      "addressType": "Home",
      "addressLine1": "123 Watt Ave",
      "city": "Folsom",
      "state": "CA",
      "postalCode": "93845",
      "countryCode": "+1",
      "current": true
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.addressLine1 == "123 Watt Ave"
    # Add phone
    Given path "/api/accounts/add-account-phone"
    And param primaryPersonId = id
    And header Authorization = "Bearer " + token
    * def randomPhoneNumber = dataGenerator.getPhoneNumber()
    Then request
      """
      {
      "phoneNumber": "#(randomPhoneNumber)",
      "phoneExtension": "2",
      "phoneTime": "Anytime",
      "phoneType": "Mobile"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.phoneNumber == "randomPhoneNumber"
    # Add car
    Given path "/api/accounts/add-account-car"
    And param primaryPersonId = id
    And header Authorization = "Bearer " + token
    Then request
      """
      {
      "make": "Lombo",
      "model": "xx5",
      "year": "2022",
      "licensePlate": "098Lambo123"
      }
      """
    When method post
    Then status 201
    And print response
    And assert response.licensePlate == "098Lambo123"
    # Get account
    Given path "/api/accounts/get-account"
    And param primaryPersonId = id
    And header Authorization = "Bearer " + token
    When method get
    Then status 200
    And print response
   
