# frozen_string_literal: true

require_relative 'helper'

include Spectus

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

it { Opushon.load(@object).to_h }.MUST eql({:GET=>{:title=>"List issues", :description=>"List all issues across all the authenticated user's visible repositories.", :request=>{:headers=>{:"Auth-Token"=>{:title=>"", :description=>"Authentication Token.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>nil, :minlen=>32, :maxlen=>nil, :pattern=>nil}}, :query_string=>{:page=>{:title=>"", :description=>"Identify the page to return.", :type=>"number", :nullifiable=>true, :restricted_values=>nil, :example=>nil, :min=>1, :max=>nil}, :per_page=>{:title=>"", :description=>"Indicate the number of issues per page.", :type=>"number", :nullifiable=>true, :restricted_values=>nil, :example=>nil, :min=>1, :max=>100}, :state=>{:title=>"", :description=>"Indicates the state of the issues to return.", :type=>"string", :nullifiable=>true, :restricted_values=>[{:title=>"Open", :description=>"", :value=>"open"}, {:title=>"Closed", :description=>"", :value=>"closed"}, {:title=>"All", :description=>"", :value=>"all"}], :example=>nil, :minlen=>nil, :maxlen=>nil, :pattern=>nil}}, :body=>{}}, :response=>{:headers=>{}, :body=>{:created_at=>{:title=>"", :description=>"The datetime that the resource was created at.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"2014-01-01T01:01:01Z", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :title=>{:title=>"", :description=>"The title of the resource.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"Found a bug", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :body=>{:title=>"", :description=>"The body of the resource.", :type=>"string", :nullifiable=>true, :restricted_values=>nil, :example=>"I'm having a problem with this.", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :state=>{:title=>"", :description=>"Indicates the state of the issue.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"open", :minlen=>nil, :maxlen=>nil, :pattern=>nil}}}}, :POST=>{:title=>"Create an issue", :description=>"Any user with pull access to a repository can create an issue.", :request=>{:headers=>{:"Auth-Token"=>{:title=>"", :description=>"Authentication Token.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>nil, :minlen=>32, :maxlen=>nil, :pattern=>nil}}, :query_string=>{}, :body=>{:title=>{:title=>"", :description=>"Issue title.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"Found a bug", :minlen=>nil, :maxlen=>255, :pattern=>nil}, :body=>{:title=>"", :description=>"Issue body.", :type=>"string", :nullifiable=>true, :restricted_values=>nil, :example=>"I'm having a problem with this.", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :labels=>{:title=>"", :description=>"Labels to associate with this issue.", :type=>"string", :nullifiable=>true, :restricted_values=>[{:title=>"Java", :description=>"", :value=>"label_1"}, {:title=>"Ruby", :description=>"", :value=>"label_2"}, {:title=>"Elixir", :description=>"", :value=>"label_3"}], :example=>["label_1", "label_2"], :minlen=>nil, :maxlen=>nil, :pattern=>nil}}}, :response=>{:headers=>{}, :body=>{}}}, :DELETE=>{:title=>"Delete issues", :description=>"Remove every issues.", :request=>{:headers=>{:"Auth-Token"=>{:title=>"", :description=>"Authentication Token.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>nil, :minlen=>32, :maxlen=>nil, :pattern=>nil}}, :query_string=>{}, :body=>{}}, :response=>{:headers=>{}, :body=>{}}}})

# it is expected to dump the JSON

opushon = Opushon.load(@object)

it { JSON.parse(Opushon.dump(opushon), symbolize_names: true) }.MUST eql({:GET=>{:title=>"List issues", :description=>"List all issues across all the authenticated user's visible repositories.", :request=>{:headers=>{:"Auth-Token"=>{:title=>"", :description=>"Authentication Token.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>nil, :minlen=>32, :maxlen=>nil, :pattern=>nil}}, :query_string=>{:page=>{:title=>"", :description=>"Identify the page to return.", :type=>"number", :nullifiable=>true, :restricted_values=>nil, :example=>nil, :min=>1, :max=>nil}, :per_page=>{:title=>"", :description=>"Indicate the number of issues per page.", :type=>"number", :nullifiable=>true, :restricted_values=>nil, :example=>nil, :min=>1, :max=>100}, :state=>{:title=>"", :description=>"Indicates the state of the issues to return.", :type=>"string", :nullifiable=>true, :restricted_values=>[{:title=>"Open", :description=>"", :value=>"open"}, {:title=>"Closed", :description=>"", :value=>"closed"}, {:title=>"All", :description=>"", :value=>"all"}], :example=>nil, :minlen=>nil, :maxlen=>nil, :pattern=>nil}}, :body=>{}}, :response=>{:headers=>{}, :body=>{:created_at=>{:title=>"", :description=>"The datetime that the resource was created at.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"2014-01-01T01:01:01Z", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :title=>{:title=>"", :description=>"The title of the resource.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"Found a bug", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :body=>{:title=>"", :description=>"The body of the resource.", :type=>"string", :nullifiable=>true, :restricted_values=>nil, :example=>"I'm having a problem with this.", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :state=>{:title=>"", :description=>"Indicates the state of the issue.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"open", :minlen=>nil, :maxlen=>nil, :pattern=>nil}}}}, :POST=>{:title=>"Create an issue", :description=>"Any user with pull access to a repository can create an issue.", :request=>{:headers=>{:"Auth-Token"=>{:title=>"", :description=>"Authentication Token.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>nil, :minlen=>32, :maxlen=>nil, :pattern=>nil}}, :query_string=>{}, :body=>{:title=>{:title=>"", :description=>"Issue title.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>"Found a bug", :minlen=>nil, :maxlen=>255, :pattern=>nil}, :body=>{:title=>"", :description=>"Issue body.", :type=>"string", :nullifiable=>true, :restricted_values=>nil, :example=>"I'm having a problem with this.", :minlen=>nil, :maxlen=>nil, :pattern=>nil}, :labels=>{:title=>"", :description=>"Labels to associate with this issue.", :type=>"string", :nullifiable=>true, :restricted_values=>[{:title=>"Java", :description=>"", :value=>"label_1"}, {:title=>"Ruby", :description=>"", :value=>"label_2"}, {:title=>"Elixir", :description=>"", :value=>"label_3"}], :example=>["label_1", "label_2"], :minlen=>nil, :maxlen=>nil, :pattern=>nil}}}, :response=>{:headers=>{}, :body=>{}}}, :DELETE=>{:title=>"Delete issues", :description=>"Remove every issues.", :request=>{:headers=>{:"Auth-Token"=>{:title=>"", :description=>"Authentication Token.", :type=>"string", :nullifiable=>false, :restricted_values=>nil, :example=>nil, :minlen=>32, :maxlen=>nil, :pattern=>nil}}, :query_string=>{}, :body=>{}}, :response=>{:headers=>{}, :body=>{}}}})
