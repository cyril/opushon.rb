# Opushon

[![Build Status](https://travis-ci.org/cyril/opushon.svg?branch=master)](https://travis-ci.org/cyril/opushon)
[![Dependency Status](https://gemnasium.com/cyril/opushon.svg)](https://gemnasium.com/cyril/opushon)
[![Gem Version](http://img.shields.io/gem/v/opushon.svg)](https://rubygems.org/gems/opushon)
[![Inline docs](http://inch-ci.org/github/cyril/opushon.svg?branch=master)](http://inch-ci.org/github/cyril/opushon)
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)](http://rubydoc.info/gems/opushon/frames)

> An [Opushon's body](https://github.com/cyril/opushon) parser and emitter.

## Contact

* Home page: https://github.com/cyril/opushon
* Bugs/issues: https://github.com/cyril/opushon/issues
* Support: https://stackoverflow.com/questions/tagged/opushon

## Rubies

* [MRI](https://www.ruby-lang.org/)
* [Rubinius](http://rubini.us/)
* [JRuby](http://jruby.org/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'opushon'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install opushon

## Usage

```ruby
# Parse some Opushon
opushon = Opushon.load('{
            "DELETE": {
              "title": "Delete issues",
              "description": "Remove every issues.",
              "request": {
                "headers": {},
                "query_string": {},
                "body": {}
              },
              "response": {
                "headers": {},
                "query_string": {},
                "body": {}
              }
            }
          }') # => an Opushon instance

# Emit some Opushon
Opushon.dump(opushon) # => '{"DELETE":{"title":"Delete issues","description":"Remove every issues.","request":{"headers":{},"query_string":{},"body":{}},"response":{"headers":{},"query_string":{},"body":{}}}}'
```

## Contributing

1. [Fork it](https://github.com/cyril/opushon.rb/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
