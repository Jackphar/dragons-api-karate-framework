@Regression
Feature: Random Account Creation

  Background: Setup url and token
    * def tokenFeature = callonce read('GenerateToken.feature')
    * def token = tokenFeature.response.token
    Given url "https://tek-insurance-api.azurewebsites.net"

  Scenario: Create account with random email
    # to call JAVA class and method name, we need the method = Java.type(the java class path)
    * def dataGenerator = Java.type('api.data.GenerateData')
    * def rondomEmail = dataGenerator.getEmail()
    And print rondomEmail
    
