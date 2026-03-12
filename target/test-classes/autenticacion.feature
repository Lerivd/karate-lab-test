Feature: Validamos autenticacion y consulta de usuarios

  Background: Configuracion inicial
    * karate.configure('ssl', true)
    * def baseURL = 'https://dummyjson.com'
    * def autenticacion = read('classpath:/json_files/autenticacion.json')

  Scenario: Autenticacion del token
    Given url baseURL
    And path '/auth/login'
    And header Content-Type = 'application/json'
    And request autenticacion
    When method post
    Then status 200
    And print 'response:', response