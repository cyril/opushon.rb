require_relative 'spec_helper'

describe Opushon do
  describe '.load' do
    let :options_account do
      Opushon.load('{
        "DELETE": {
          "title": "Delete account",
          "description": "Remove my account please!!",
          "foo": "bar"
        }
      }')
    end

    let :options_issues do
      Opushon.load('{
        "GET": {
          "title": "List issues",
          "description": "List all issues across all the authenticated user\'s visible repositories.",
          "query_string": {
            "page": {
              "type": "number",
              "description": "Identify the page to return.",
              "min": 1,
              "max": null,
              "step": 1
            },
            "per_page": {
              "type": "number",
              "description": "Indicate the number of issues per page.",
              "min": 1,
              "max": 100,
              "step": 1
            },
            "state": {
              "description": "Indicates the state of the issues to return.",
              "options": {
                "open": "Open",
                "closed": "Closed",
                "all": "All"
              },
              "default": "open",
              "multiple": true,
              "nullifiable": true
            }
          },
          "parameters": {
            "created_at": {
              "type": "string",
              "description": "The datetime that the resource was created at.",
              "nullifiable": false
            },
            "title": {
              "type": "string",
              "description": "The title of the resource.",
              "maxlen": 255,
              "nullifiable": false
            },
            "body": {
              "type": "string",
              "description": "The body of the resource.",
              "maxlen": 10000,
              "nullifiable": true
            },
            "state": {
              "type": "string",
              "description": "Indicates the state of the issue.",
              "maxlen": 255,
              "options": {
                "open": "Open",
                "closed": "Closed",
                "all": "All"
              },
              "multiple": false,
              "nullifiable": false
            }
          },
          "example": [
            {
              "created_at": "2014-01-01T01:01:01Z",
              "title": "Found a bug",
              "body": "I\'m having a problem with this.",
              "state": "open"
            }
          ]
        },
        "POST": {
          "title": "Create an issue",
          "description": "Any user with pull access to a repository can create an issue.",
          "query_string": {},
          "parameters": {
            "title": {
              "type": "string",
              "description": "Issue title.",
              "maxlen": 255,
              "nullifiable": false
            },
            "body": {
              "type": "string",
              "description": "Issue body.",
              "nullifiable": true
            },
            "labels": {
              "type": "string",
              "description": "Labels to associate with this issue.",
              "multiple": true,
              "nullifiable": true,
              "options": {
                "label_1": "Java",
                "label_2": "Ruby",
                "label_3": "Elixir"
              }
            }
          },
          "example": {
            "title": "Found a bug",
            "body": "I\'m having a problem with this.",
            "labels": [
              "label_1",
              "label_2"
            ]
          }
        },
        "DELETE": {
          "title": "Delete issues",
          "description": "Remove every issues."
        }
      }')
    end

    it 'MUST raise a JSON parser error' do
      lambda do
        Opushon.load('{"DELETE":{"title":"Delete issues"')
      end.must_raise(JSON::ParserError)
    end

    it 'MUST raise a Opushon syntax error' do
      lambda do
        Opushon.load('["BOOM"]')
      end.must_raise(Opushon::SyntaxError)
    end

    it 'MUST raise a Opushon verb error' do
      lambda do
        Opushon.load('{"BOOM":{}}')
      end.must_raise(Opushon::VerbError)
    end

    describe '#to_h' do
      it 'MUST load opushon in to a Ruby data structure' do
        options_account.to_h.must_equal({
          'DELETE' => {
            'title'         => 'Delete account',
            'description'   => 'Remove my account please!!',
            'query_string'  => {},
            'parameters'    => {},
            'example'       => nil,
            'foo'           => 'bar'
          }
        })
      end

      it 'MUST load opushon having query_string and parameters' do
        options_issues.to_h.must_equal({
          "GET"=>{
            "title"=>"List issues",
            "description"=>"List all issues across all the authenticated user's visible repositories.",
            "query_string"=>{
              "page"=>{
                "nullifiable"=>true,
                "multiple"=>false,
                "description"=>"Identify the page to return.",
                "options"=>nil,
                "default"=>0,
                "type"=>"number",
                "min"=>1,
                "max"=>nil,
                "step"=>1
              },
              "per_page"=>{
                "nullifiable"=>true,
                "multiple"=>false,
                "description"=>"Indicate the number of issues per page.",
                "options"=>nil,
                "default"=>0,
                "type"=>"number",
                "min"=>1,
                "max"=>100,
                "step"=>1
              },
              "state"=>{
                "nullifiable"=>true,
                "multiple"=>true,
                "description"=>"Indicates the state of the issues to return.",
                "options"=>{
                  "open"=>"Open",
                  "closed"=>"Closed",
                  "all"=>"All"
                },
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>nil,
                "pattern"=>nil
              }
            },
            "parameters"=>{
              "created_at"=>{
                "nullifiable"=>false,
                "multiple"=>false,
                "description"=>"The datetime that the resource was created at.",
                "options"=>nil,
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>nil,
                "pattern"=>nil
              },
              "title"=>{
                "nullifiable"=>false,
                "multiple"=>false,
                "description"=>"The title of the resource.",
                "options"=>nil,
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>255,
                "pattern"=>nil
              },
              "body"=>{
                "nullifiable"=>true,
                "multiple"=>false,
                "description"=>"The body of the resource.",
                "options"=>nil,
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>10000,
                "pattern"=>nil
              },
              "state"=>{
                "nullifiable"=>false,
                "multiple"=>false,
                "description"=>"Indicates the state of the issue.",
                "options"=>{
                  "open"=>"Open",
                  "closed"=>"Closed",
                  "all"=>"All"
                },
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>255,
                "pattern"=>nil
              }
            },
            "example"=>[
              {
                "created_at"=>"2014-01-01T01:01:01Z",
                "title"=>"Found a bug",
                "body"=>"I'm having a problem with this.",
                "state"=>"open"
              }
            ]
          },
          "POST"=>{
            "title"=>"Create an issue",
            "description"=>"Any user with pull access to a repository can create an issue.",
            "query_string"=>{},
            "parameters"=>{
              "title"=>{
                "nullifiable"=>false,
                "multiple"=>false,
                "description"=>"Issue title.",
                "options"=>nil,
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>255,
                "pattern"=>nil
              },
              "body"=>{
                "nullifiable"=>true,
                "multiple"=>false,
                "description"=>"Issue body.",
                "options"=>nil,
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>nil,
                "pattern"=>nil
              },
              "labels"=>{
                "nullifiable"=>true,
                "multiple"=>true,
                "description"=>"Labels to associate with this issue.",
                "options"=>{
                  "label_1"=>"Java",
                  "label_2"=>"Ruby",
                  "label_3"=>"Elixir"
                },
                "default"=>"",
                "type"=>"string",
                "minlen"=>nil,
                "maxlen"=>nil,
                "pattern"=>nil
              }
            },
            "example"=>{
              "title"=>"Found a bug",
              "body"=>"I'm having a problem with this.",
              "labels"=>[
                "label_1",
                "label_2"
              ]
            }
          },
          "DELETE"=>{
            "title"=>"Delete issues",
            "description"=>"Remove every issues.",
            "query_string"=>{},
            "parameters"=>{},
            "example"=>nil
          }
        })
      end
    end

    describe '#valid?' do
      it 'MUST valid the Ruby object o to a Opushon string' do
        options_issues.valid?(:POST, {
          "title"   => "Found a bug",
          "body"    => "I'm having a problem with this.",
          "labels"  => [
            "label_1",
            "label_2"
          ]
        }).must_equal(true)
      end
    end
  end

  describe '.dump' do
    it 'MUST dump Ruby object o to a Opushon string' do
      Opushon.dump({
        DELETE: {
          title:        'Delete issues',
          description:  'Remove every issues.'
        }
      }).must_equal('{"DELETE":{"title":"Delete issues","description":"Remove every issues."}}')
    end
  end
end
