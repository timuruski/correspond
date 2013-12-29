Feature: Basic REST verbs
  As a developer
  I want to be able to make basic REST requests
  So that I can test an HTTP client

  Scenario: GET request
    When I request "/get"
    Then the response should be successful
    Then the response should be JSON
