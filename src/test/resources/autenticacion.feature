Feature: Validamos consulta de usuarios

  Background: Configuracion inicial
    * karate.configure('ssl', true);
    * def baseURL = 'https://dummyjson.com'
    * def tokenRequest = call read('classpath:/token.feature')
    * def token = tokenRequest.respuesta.accessToken
    * print tokenRequest

  Scenario: Consulta del usuario
    Given url baseURL
    And path '/auth/me'
    And header Authorization = 'Bearer ' + token
    When method get
    Then status 200
    And match response.address.city == 'Washington'