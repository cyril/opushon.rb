require_relative 'spec_helper'

describe Opushon do
  subject { Opushon }

  describe '.load' do
    let :opushon_string do
      '{
          "GET": {
              "title": "List issues",
              "description": "List all issues across all the authenticated user\'s visible repositories.",
              "parameters": {
                  "input": {
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
                  "output": {
                      "created_at": {
                          "type": "string",
                          "description": "The datetime that the resource was created at.",
                          "nullifiable": false
                      },
                      "title": {
                          "type": "string",
                          "description": "The title of the resource.",
                          "nullifiable": false
                      },
                      "body": {
                          "type": "string",
                          "description": "The body of the resource.",
                          "nullifiable": true
                      },
                      "state": {
                          "type": "string",
                          "description": "Indicates the state of the issue.",
                          "nullifiable": false
                      }
                  }
              },
              "examples": {
                  "input": null,
                  "output": [
                      {
                          "created_at": "2014-01-01T01:01:01Z",
                          "title": "Found a bug",
                          "body": "I\'m having a problem with this.",
                          "state": "open"
                      }
                  ]
              }
          },
          "POST": {
              "title": "Create an issue",
              "description": "Any user with pull access to a repository can create an issue.",
              "parameters": {
                  "input": {
                      "title": {
                          "query_string": false,
                          "type": "string",
                          "description": "Issue title.",
                          "maxlen": 255,
                          "nullifiable": false
                      },
                      "body": {
                          "query_string": false,
                          "type": "string",
                          "description": "Issue body.",
                          "nullifiable": true
                      },
                      "labels": {
                          "query_string": false,
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
                          ]
                      }
                  },
                  "output": null
              },
              "examples": {
                  "input": {
                      "title": "Found a bug",
                      "body": "I\'m having a problem with this.",
                      "labels": [
                          "label_1",
                          "label_2"
                      ]
                  },
                  "output": null
              }
          },
          "DELETE": {
              "title": "Delete issues",
              "description": "Remove every issues.",
              "parameters": {
                  "input": null,
                  "output": null
              },
              "examples": {
                  "input": null,
                  "output": null
              }
          }
      }'
    end

    describe '#to_h' do
      it 'MUST load opushon having query_string and parameters' do
        subject.load(opushon_string).to_h.must_equal({
            :GET=>{
                :title=>"List issues",
                :description=>"List all issues across all the authenticated user's visible repositories.",
                :parameters=>{
                    :input=>{
                        :page=>{
                            :query_string=>true,
                            :restricted_values=>nil,
                            :title=>"",
                            :description=>"Identify the page to return.",
                            :nullifiable=>true,
                            :type=>:number,
                            :min=>1,
                            :max=>nil
                        },
                        :per_page=>{
                            :query_string=>true,
                            :restricted_values=>nil,
                            :title=>"",
                            :description=>"Indicate the number of issues per page.",
                            :nullifiable=>true,
                            :type=>:number,
                            :min=>1,
                            :max=>100
                        },
                        :state=>{
                            :query_string=>true,
                            :restricted_values=>[
                                {
                                    :title=>"Open",
                                    :description=>"",
                                    :value=>"open"
                                },
                                {
                                    :title=>"Closed",
                                    :description=>"",
                                    :value=>"closed"
                                },
                                {
                                    :title=>"All",
                                    :description=>"",
                                    :value=>"all"
                                }
                            ],
                            :title=>"",
                            :description=>"Indicates the state of the issues to return.",
                            :nullifiable=>true,
                            :type=>:string,
                            :minlen=>nil,
                            :maxlen=>nil,
                            :pattern=>nil
                        }
                    },
                    :output=>{
                        :created_at=>{
                            :title=>"",
                            :description=>"The datetime that the resource was created at.",
                            :nullifiable=>false,
                            :type=>:string
                        },
                        :title=>{
                            :title=>"",
                            :description=>"The title of the resource.",
                            :nullifiable=>false,
                            :type=>:string
                        },
                        :body=>{
                            :title=>"",
                            :description=>"The body of the resource.",
                            :nullifiable=>true,
                            :type=>:string
                        },
                        :state=>{
                            :title=>"",
                            :description=>"Indicates the state of the issue.",
                            :nullifiable=>false,
                            :type=>:string
                        }
                    }
                },
                :examples=>{
                    :input=>nil,
                    :output=>[
                        {
                            :created_at=>"2014-01-01T01:01:01Z",
                            :title=>"Found a bug",
                            :body=>"I'm having a problem with this.",
                            :state=>"open"
                        }
                    ]
                }
            },
            :POST=>{
                :title=>"Create an issue",
                :description=>"Any user with pull access to a repository can create an issue.",
                :parameters=>{
                    :input=>{
                        :title=>{
                            :query_string=>false,
                            :restricted_values=>nil,
                            :title=>"",
                            :description=>"Issue title.",
                            :nullifiable=>false,
                            :type=>:string,
                            :minlen=>nil,
                            :maxlen=>255,
                            :pattern=>nil
                        },
                        :body=>{
                            :query_string=>false,
                            :restricted_values=>nil,
                            :title=>"",
                            :description=>"Issue body.",
                            :nullifiable=>true,
                            :type=>:string,
                            :minlen=>nil,
                            :maxlen=>nil,
                            :pattern=>nil
                        },
                        :labels=>{
                            :query_string=>false,
                            :restricted_values=>[
                                {
                                    :title=>"Java",
                                    :description=>"",
                                    :value=>"label_1"
                                },
                                {
                                    :title=>"Ruby",
                                    :description=>"",
                                    :value=>"label_2"
                                },
                                {
                                    :title=>"Elixir",
                                    :description=>"",
                                    :value=>"label_3"
                                }
                            ],
                            :title=>"",
                            :description=>"Labels to associate with this issue.",
                            :nullifiable=>true,
                            :type=>:string,
                            :minlen=>nil,
                            :maxlen=>nil,
                            :pattern=>nil
                        }
                    },
                    :output=>nil
                },
                :examples=>{
                    :input=>{
                        :title=>"Found a bug",
                        :body=>"I'm having a problem with this.",
                        :labels=>[
                            "label_1",
                            "label_2"
                        ]
                    },
                    :output=>nil
                }
            },
            :DELETE=>{
                :title=>"Delete issues",
                :description=>"Remove every issues.",
                :parameters=>{
                    :input=>nil,
                    :output=>nil
                },
                :examples=>{
                    :input=>nil,
                    :output=>nil
                }
            }
        })
      end
    end
  end

  describe '.dump' do
    it 'MUST dump Ruby object o to a Opushon string' do
      JSON.load(
        Opushon.dump({
          DELETE: {
            title:        'Delete issues',
            description:  'Remove every issues.'
          }
        })
      ).must_equal(
        JSON.load("{\"DELETE\":{\"title\":\"Delete issues\",\"description\":\"Remove every issues.\"}}")
      )
    end
  end
end
