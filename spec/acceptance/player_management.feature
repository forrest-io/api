Feature: Player Management

  @wip
  Scenario: Create/Read

    Given I POST to "/players" with the following details:
      | :name | :email           |
      | James | james@forrest.io |
    Then I should receive a HTTP 201 Created response
    And a Location header should be available

    When I follow the Location header
    Then James should have the following details:
      | :name | :email           |
      | James | james@forrest.io |
    And I should receive a HTTP 200 OK response

  @wip
  Scenario: Update

    Given a player named Anthony exists
    When I PATCH "/players/anthony" with the following details:
      | :email             |
      | anthony@forrest.io |
    Then I should receive a HTTP 200 OK response
    
    When I GET "/players/anthony"
    Then Anthony should have the following details:
      | :email             |
      | anthony@forrest.io |
    And I should receive a HTTP 200 OK response

  @wip
  Scenario: Delete

    Given a player named Chris exists
    When I DELETE "/players/chris"
    Then I should receive a HTTP 200 OK response
    And Chris should no longer exist
