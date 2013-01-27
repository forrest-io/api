# forrest.io - api

The core of [forrest.io](http://www.forrest.io) is an open API, built to power the web application, mobile apps and any other inventive solutions to home or office ping pong management.

## functions

* player management
* score tracking
* rating and ranking
* data access

## rating systems

the initial rating system will most-likely be based upon the [USATT rating system](http://www.teamusa.org/USA-Table-Tennis/Ratings/How%20Does%20the%20USATT%20Rating%20System%20work.aspx), but this is expected to change in the future

the current plan is to make the rating system a modular piece of the API, such that groups can choose their favourite rating system without impacting other groups, or possibly even implement their own system

## integrations

### planned

* web application
* iOS app
* android app
* command-line tool

### other ideas

* arduino-powered live scoring system
* score entry via [hubot](http://hubot.github.com/)

## decisions

* timestamps are served in the [ISO 8601](http://en.wikipedia.org/wiki/ISO_8601) format
* the API will list the ranking of each player, even though the calculation is quite obvious
* results are first broken down into teams, then players, even if it is a singles match

## in the future

* determine an approach to versioning the API
* add proper [HATEOAS](http://en.wikipedia.org/wiki/HATEOAS) support by adding `rel` attributes to the links
* add a winner/loser flag to result objects (if the need arises)

## examples

### GET /players

    [
      {
        "name" : "Leslie Knope",
        "rating" : 1000,
        "ranking" : "1st",
        "recent" : ["W", "L", "W", "W", "L"],
        "href" : "/players/leslie"
      },
      {
        "name" : "Ben Wyatt",
        "rating" : 950,
        "ranking" : "2nd",
        "recent" : ["L", "W", "L", "L", "W"],
        "href" : "/players/ben"
      },

      ...

    ]

### GET /players/leslie

    {
      "name" : "Leslie Knope",
      "rating" : 1000,
      "ranking" : "1st",
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
        },

        ...

      ]
    }

### GET /results

    [
      {
        "timestamp" : "2013-01-01T06:00Z",
        "href" : "/results/1",
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
      },

      ...

    ]

### GET /results/1

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
      ],
      "future" : [
        
        ...
        
      ],
      "past" : [
        
        ...
        
      ]
    }

# license

## MIT

Copyright &copy; 2013 James Ottaway and Anthony Short

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
