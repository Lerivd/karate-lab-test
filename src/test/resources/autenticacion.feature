Feature: Validamos autenticacion y consulta de usuarios

  Background: Configuracion inicial
    * karate.configure('ssl', true)
    * def baseURL = 'https://dummyjson.com'
    * def autenticacion = read('classpath:/json_files/autenticacion.json')
    Given url baseURL
    And path '/auth/login'
    And header Content-Type = 'application/json'
    And request autenticacion
    When method post
    Then status 200
    And def respuesta = response
    And print 'respuesta:', respuesta

  Scenario: Consulta del usuario
    Given url baseURL
    And path '/auth/me'
    And header Authorization = 'Bearer ' + respuesta.accessToken
    When method get
    Then status 200
    And match response.address.city == 'Washington'