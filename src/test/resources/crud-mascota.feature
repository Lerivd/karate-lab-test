Feature: Validacion de Endpoints PI PetStore

  Background: Configuracion inicial
    * karate.configure('ssl', true);
  
  Scenario: Creacion de mascota
    Given url "https://petstore.swagger.io/v2/pet"
    And request
    """
      {
        "id": "000000123",
        "category": {
          "id": 0,
          "name": "perros"
        },
        "name": "firu",
        "photoUrls": [
          "string"
        ],
        "tags": [
          {
            "id": 0,
            "name": "string"
          }
        ],
        "status": "available"
      }
    """
    When method post
    Then status 200
    And match response.name == "firu"