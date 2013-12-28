Feature: Basic REST verbs
  Scenario: GET request
    When I request /get
    Then the response should have a 200 status code
