Feature: Simple BDD example with express server

    Scenario: Hello world on root
        Given I make a GET request to http://localhost:3000
         When I receive a response
         Then I expect response should have a status 200
         Then I expect response should have a body "Hello World!"

    Scenario: Return all users
        Given I make a GET request to http://localhost:3000/users
         When I receive a response
         Then I expect response should have a status 200
         Then I expect response should have a json
          """
          [{
              "username": "johndoe",
              "firstName": "John",
              "lastName": "Doe",
              "age": 21
          }, {
              "username": "janedoe",
              "firstName": "Jane",
              "lastName": "Doe",
              "age": 25
          }]
          """
    
    Scenario: Create new user
        Given I make a POST request to http://localhost:3000/users
          And I set body to
          """
          {
            "username": "newuser",
            "firstName": "Michael",
            "lastName": "Lawson",
            "age": 40
          }
          """
          When I receive a response
          Then I expect response should have a status 201