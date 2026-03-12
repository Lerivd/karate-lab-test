Feature: Funcionalidades de Usuario

  Background: Configuraciones
    * def peticion = read('classpath:/json_files/userRequest.json')

    # Verificar que la edad sea un numero
    Scenario Outline: Crear Usuario
      Given url baseURL
      And path '/users/add'
      And peticion.firstName = '<nombre>'
      And peticion.lastName = '<apellido>'
      And peticion.age = <edad>
      And peticion.username = '<usuario>'
      And peticion.password = '<clave>'
      And request peticion
      When method post
      Then status 201
      And match response.age == <edad>
      Examples:
      | read('classpath:/csv/data.csv') |