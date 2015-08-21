require_relative 'helper'

# OPTIONS /issues
# HTTP/1.1 200 OK
# Allow: OPTIONS,HEAD,GET,POST,DELETE
# Content-Type: application/json
# Content-Language: en

@object = '{
  "GET": {
    "title": "List issues",
    "description": "List all issues across all the authenticated user\'s visible repositories.",
    "request": {
      "headers": {
        "Auth-Token": {
          "type": "string",
          "description": "Authentication Token.",
          "nullifiable": false,
          "minlen": 32,
          "example": null
        }
      },
      "query_string": {
        "page": {
          "type": "number",
          "description": "Identify the page to return.",
          "min": 1,
          "max": null
        },
        "per_page": {
          "type": "number",
          "description": "Indicate the number of issues per page.",
          "min": 1,
          "max": 100
        },
        "state": {
          "description": "Indicates the state of the issues to return.",
          "restricted_values": [
            {
              "value": "open",
              "title": "Open"
            },
            {
              "value": "closed",
              "title": "Closed"
            },
            {
              "value": "all",
              "title": "All"
            }
          ],
          "nullifiable": true
        }
      },
      "body": {}
    },
    "response": {
      "headers": {},
      "query_string": {},
      "body": {
        "created_at": {
          "type": "string",
          "description": "The datetime that the resource was created at.",
          "nullifiable": false,
          "example": "2014-01-01T01:01:01Z"
        },
        "title": {
          "type": "string",
          "description": "The title of the resource.",
          "nullifiable": false,
          "example": "Found a bug"
        },
        "body": {
          "type": "string",
          "description": "The body of the resource.",
          "nullifiable": true,
          "example": "I\'m having a problem with this."
        },
        "state": {
          "type": "string",
          "description": "Indicates the state of the issue.",
          "nullifiable": false,
          "example": "open"
        }
      }
    }
  },
  "POST": {
    "title": "Create an issue",
    "description": "Any user with pull access to a repository can create an issue.",
    "request": {
      "headers": {
        "Auth-Token": {
          "type": "string",
          "description": "Authentication Token.",
          "nullifiable": false,
          "minlen": 32,
          "example": null
        }
      },
      "query_string": {},
      "body": {
        "title": {
          "type": "string",
          "description": "Issue title.",
          "maxlen": 255,
          "nullifiable": false,
          "example": "Found a bug"
        },
        "body": {
          "type": "string",
          "description": "Issue body.",
          "nullifiable": true,
          "example": "I\'m having a problem with this."
        },
        "labels": {
          "type": "string",
          "description": "Labels to associate with this issue.",
          "nullifiable": true,
          "restricted_values": [
            {
              "value": "label_1",
              "title": "Java"
            },
            {
              "value": "label_2",
              "title": "Ruby"
            },
            {
              "value": "label_3",
              "title": "Elixir"
            }
          ],
          "example": [
            "label_1",
            "label_2"
          ]
        }
      }
    },
    "response": {
      "headers": {},
      "query_string": {},
      "body": {}
    }
  },
  "DELETE": {
    "title": "Delete issues",
    "description": "Remove every issues.",
    "request": {
      "headers": {
        "Auth-Token": {
          "type": "string",
          "description": "Authentication Token.",
          "nullifiable": false,
          "minlen": 32,
          "example": null
        }
      },
      "query_string": {},
      "body": {}
    },
    "response": {
      "headers": {},
      "query_string": {},
      "body": {}
    }
  }
}'

# it is expected to load the JSON

Spectus.this { Opushon.load(@object).to_h }.MUST Eql: {
  :GET=>{
    :title=>"List issues",
    :description=>"List all issues across all the authenticated user's visible repositories.",
    :request=>{
      :headers=>{
        :"Auth-Token"=>nil
      },
      :query_string=>{
        :page=>{
          :title=>"",
          :description=>"Identify the page to return.",
          :type=>"number",
          :nullifiable=>true,
          :restricted_values=>[

          ],
          :example=>nil,
          :min=>1,
          :max=>nil
        },
        :per_page=>{
          :title=>"",
          :description=>"Indicate the number of issues per page.",
          :type=>"number",
          :nullifiable=>true,
          :restricted_values=>[

          ],
          :example=>nil,
          :min=>1,
          :max=>100
        },
        :state=>nil
      },
      :body=>{

      }
    },
    :response=>{
      :headers=>{

      },
      :body=>{
        :created_at=>nil,
        :title=>nil,
        :body=>nil,
        :state=>nil
      }
    }
  },
  :PATCH=>nil,
  :PUT=>nil,
  :POST=>{
    :title=>"Create an issue",
    :description=>"Any user with pull access to a repository can create an issue.",
    :request=>{
      :headers=>{
        :"Auth-Token"=>nil
      },
      :query_string=>{

      },
      :body=>{
        :title=>nil,
        :body=>nil,
        :labels=>nil
      }
    },
    :response=>{
      :headers=>{

      },
      :body=>{

      }
    }
  },
  :DELETE=>{
    :title=>"Delete issues",
    :description=>"Remove every issues.",
    :request=>{
      :headers=>{
        :"Auth-Token"=>nil
      },
      :query_string=>{

      },
      :body=>{

      }
    },
    :response=>{
      :headers=>{

      },
      :body=>{

      }
    }
  }
}

# it is expected to dump the JSON

opushon = Opushon.load(@object)

Spectus.this { JSON.parse(Opushon.dump(opushon), symbolize_names: true) }.MUST Eql: {
  :GET=>{
    :title=>"List issues",
    :description=>"List all issues across all the authenticated user's visible repositories.",
    :request=>{
      :headers=>{
        :"Auth-Token"=>nil
      },
      :query_string=>{
        :page=>{
          :title=>"",
          :description=>"Identify the page to return.",
          :type=>"number",
          :nullifiable=>true,
          :restricted_values=>[

          ],
          :example=>nil,
          :min=>1,
          :max=>nil
        },
        :per_page=>{
          :title=>"",
          :description=>"Indicate the number of issues per page.",
          :type=>"number",
          :nullifiable=>true,
          :restricted_values=>[

          ],
          :example=>nil,
          :min=>1,
          :max=>100
        },
        :state=>nil
      },
      :body=>{

      }
    },
    :response=>{
      :headers=>{

      },
      :body=>{
        :created_at=>nil,
        :title=>nil,
        :body=>nil,
        :state=>nil
      }
    }
  },
  :PATCH=>nil,
  :PUT=>nil,
  :POST=>{
    :title=>"Create an issue",
    :description=>"Any user with pull access to a repository can create an issue.",
    :request=>{
      :headers=>{
        :"Auth-Token"=>nil
      },
      :query_string=>{

      },
      :body=>{
        :title=>nil,
        :body=>nil,
        :labels=>nil
      }
    },
    :response=>{
      :headers=>{

      },
      :body=>{

      }
    }
  },
  :DELETE=>{
    :title=>"Delete issues",
    :description=>"Remove every issues.",
    :request=>{
      :headers=>{
        :"Auth-Token"=>nil
      },
      :query_string=>{

      },
      :body=>{

      }
    },
    :response=>{
      :headers=>{

      },
      :body=>{

      }
    }
  }
}
