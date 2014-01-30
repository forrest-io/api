FORMAT: 1A
HOST: http://api.forrest.io

# forrest.io

forrest.io is an office ping-pong app

# Player [/player/{slug}]

An individual Player object

+ Parameters
    + slug (required, string)

## Retrieve a Player [GET]

+ Response 200 (application/json)

    + Body

        ```
        {
          "name" : "Leslie Knope",
          "rating" : 25.06,
          "ranking" : 1,
          "results" : [
            {
              "timestamp" : "2013-01-01T06:00Z",
              "teams" : [
                {
                  "score" : 21,
                  "players" : [
                    {
                      "name" : "Leslie Knope",
                      "href" : "/players/leslie"
                    }
                  ]
                },
                {
                  "score" : 18,
                  "players" : [
                    {
                      "name" : "Ben Wyatt",
                      "href" : "/players/ben"
                    }
                  ]
                }
              ]
            }
          ]
        }
        ```

## Remove a Player [DELETE]

+ Response 204

# Players Collection [/players]

A collection of Player objects

## List all Players [GET]

+ Response 200 (application/json)

    ```
    [
      {
        "name" : "Leslie Knope",
        "rating" : 25.06,
        "ranking" : 1,
        "href" : "/players/leslie"
      },
      {
        "name" : "Ben Wyatt",
        "rating" : 24.43,
        "ranking" : 2,
        "href" : "/players/ben"
      }
    ]
    ```

## Create a Player [POST]

+ Request (application/json)

    + Body

        ```
        { "name" : "Ron Swanson" }
        ```

+ Response 201 (application/json)

    + Header

        ```
        Location: /players/ron
        ```

    + Body

        ```
        { "href" : "/players/ron" }
        ```

# Result [/result/{id}]

An individual Result object

+ Parameters
    + id (required, integer)

## Retrieve a Result [GET]

+ Response 200 (application/json)

    + Body

        ```
        {
          "href" : "/results/1",
          "timestamp" : "2013-01-01T12:00Z",
          "teams" : [
            {
              "score" : 21,
              "players" : [
                {
                  "name" : "Leslie Knope",
                  "href" : "/players/leslie"
                }
              ]
            },
            {
              "score" : 18,
              "players" : [
                {
                  "name" : "Ben Wyatt",
                  "href" : "/players/ben"
                }
              ]
            }
          ]
        }
        ```

# Results Collection [/results]

A collection of Result objects

## List all Results [GET]

+ Response 200 (application/json)

    ```
    [
      {
        "href" : "/results/1",
        "timestamp" : "2013-01-01T12:00Z",
        "teams" : [
          {
            "score" : 21,
            "players" : [
              {
                "name" : "Leslie Knope",
                "href" : "/players/leslie"
              }
            ]
          },
          {
            "score" : 18,
            "players" : [
              {
                "name" : "Ben Wyatt",
                "href" : "/players/ben"
              }
            ]
          }
        ]
      }
    ]
    ```

## Create a Result [POST]

+ Request (application/json)

    + Body

        ```
        {
          "teams" : [
            {
              "score" : 21,
              "players" : [
                {
                  "name" : "Leslie Knope",
                  "href" : "/players/leslie"
                }
              ]
            },
            {
              "score" : 18,
              "players" : [
                {
                  "name" : "Ben Wyatt",
                  "href" : "/players/ben"
                }
              ]
            }
          ]
        }
        ```

+ Response 201 (application/json)

    + Header

        ```
        Location: /results/2
        ```

    + Body

        ```
        { "href" : "/results/2" }
        ```
