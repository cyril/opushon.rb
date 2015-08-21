# Opushon

[![Build Status](https://travis-ci.org/cyril/opushon.rb.svg?branch=master)][travis]
[![Gem Version](https://badge.fury.io/rb/opushon.svg)][gem]
[![Inline docs](http://inch-ci.org/github/cyril/opushon.rb.svg?branch=master)][inchpages]
[![Documentation](http://img.shields.io/:yard-docs-38c800.svg)][rubydoc]

> An [Opushon's body](https://github.com/cyril/opushon) parser and emitter.

## Contact

* Home page: https://github.com/cyril/opushon.rb
* Bugs/issues: https://github.com/cyril/opushon.rb/issues
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
Opushon.dump(opushon) # => "{\"GET\":null,\"PATCH\":null,\"PUT\":null,\"POST\":null,\"DELETE\":{\"title\":\"Delete issues\",\"description\":\"Remove every issues.\",\"request\":{\"headers\":{},\"query_string\":{},\"body\":{}},\"response\":{\"headers\":{},\"body\":{}}}}"
```

## Security

As a basic form of security __Opushon__ provides a set of SHA512 checksums for
every Gem release.  These checksums can be found in the `checksum/` directory.
Although these checksums do not prevent malicious users from tampering with a
built Gem they can be used for basic integrity verification purposes.

The checksum of a file can be checked using the `sha512sum` command.  For
example:

    $ sha512sum pkg/opushon-0.2.gem
    17173a517daa21256cc2391ba275f6977086ecda0e6f750fbb380ad08430bb748d5cdc927b8e904850b15fe47a121985dafa74a6b15df46100b86decf40c8cda  pkg/opushon-0.2.gem

## Versioning

__Opushon__ follows [Semantic Versioning 2.0](http://semver.org/).

## Contributing

1. [Fork it](https://github.com/cyril/opushon.rb/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

See `LICENSE.md` file.

[gem]: https://rubygems.org/gems/opushon
[travis]: https://travis-ci.org/cyril/opushon.rb
[inchpages]: http://inch-ci.org/github/cyril/opushon.rb/
[rubydoc]: http://rubydoc.info/gems/opushon/frames
