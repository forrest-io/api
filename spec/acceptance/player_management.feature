Feature: Player Management

  Scenario: Create/Read
    When I POST to "/players" with the following details:
      | :name | :email           |
      | James | james@forrest.io |
    Then I should receive a HTTP 201 response
    And the Location header should point to "/players/james"

    When I GET "/players/james"
    Then the player should have the following details:
      | :name | :email           |
      | James | james@forrest.io |
    And I should receive a HTTP 200 response

  Scenario: Update
    Given a player named Anthony exists at "/players/anthony"

    When I PATCH "/players/anthony" with the following details:
      | :email             |
      | anthony@forrest.io |
    Then I should receive a HTTP 200 response
    
    When I GET "/players/anthony"
    Then Anthony should have the following details:
      | :email             |
      | anthony@forrest.io |
    And I should receive a HTTP 200 response

  Scenario: Delete
    Given a player named Chris exists at "/players/chris"
    
    When I DELETE "/players/chris"
    Then I should receive a HTTP 200 response

    When I GET "/players/chris"
    Then I should receive a HTTP 404 response
