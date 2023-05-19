Feature: Generate Token

  Scenario: Generate a valid token
    Given url "https://tek-insurance-api.azurewebsites.net"
    Then path "/api/token"
    And request {"username": "supervisor","password": "tek_supervisor"}
    When method post
    And status 200
    Then print response
   
    
