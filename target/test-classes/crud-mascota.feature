Feature: Validacion de Endpoints PI PetStore

  Background: Configuracion inicial
    * karate.configure('ssl', true);
    * def BaseURL = "https://petstore.swagger.io/v2"
    * def petRequest = read('classpath:/json_files/petResponse.json')
  
  Scenario Outline: Creacion de mascota
    Given url BaseURL
    And path "/pet"
    And request
    """
      {
        "id": "<id>",
        "category": {
          "id": 0,
          "name": "<categoria>"
        },
        "name": "<nombre>",
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
    And match response.name == "<nombre>"
      Examples:
        | id        | nombre  | categoria |
        | 000000123 | firu    | perros    |
        | 000000124 | pecas   | gatos     |

  Scenario Outline: Consultar Mascota
    Given url BaseURL
    And path "/pet/<id>"
    When method post
    Then status 200
      Examples:
        | id        |
        | 000000123 |
        | 000000124 |

  Scenario: Actualizar Mascota
    Given url BaseURL
    And path "/pet"
    And request petRequest
    When method put
    Then status 200
    And match response.name == "Salvador"
    
  Scenario Outline: Eliminar Mascota
    Given  url BaseURL
    And path "/pet/<id>"
    When method delete
    Then status 200
    And match response.message == '<idValido>'
    Examples:
      | id        | idValido  |
#      | 000000123 | 123      |
      | 000000124 | 124       |
