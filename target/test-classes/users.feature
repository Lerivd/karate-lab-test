Feature: Funcionalidades de Usuario

  Background: Configuraciones
    * def peticion = read('classpath:/json_files/userRequest.json')

    Scenario: Crear Usuario
      Given url baseURL
      And path '/users/add'
      And request peticion
      When method post
      Then status 201