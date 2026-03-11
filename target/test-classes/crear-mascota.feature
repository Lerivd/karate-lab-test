Feature: Creación de Mascota usando karate
  #https://petstore.swagger.io/#/pet/addPet
  Scenario Outline: Creacion de Mascota mediante POST
    Given url "https://petstore.swagger.io/v2"
    And path "/pet"
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
    Then method post
    And status 200
    And match $.name == "firu"
    Examples:
    | codigo    | nombre  | categoria |
    | 000000123 | firu    | perros    |
