Feature: Ejecucion de token

  Background: Configuracion inicial
    * karate.configure('ssl', true);
    * def baseURL = 'https://dummyjson.com'
    * def autenticacion = read('classpath:/json_files/autenticacion.json')

  Scenario: Obtener token de autenticacion
    Given url baseURL
    And path '/auth/login'
    And header Content-Type = 'application/json'
    And request autenticacion
    When method post
    Then status 200
    And def respuesta = response
    And print 'respuesta:', respuesta