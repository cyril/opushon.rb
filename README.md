# Opushon

An [Opushon's body](https://github.com/cyril/opushon) parser and emitter.

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
Opushon.load('{"DELETE":{"title": "Delete issues","description":"Remove every issues."}}') # => an Opushon instance

# Emit some Opushon
Opushon.dump(an Opushon instance) # => '{"DELETE":{"title": "Delete issues","description":"Remove every issues."}}'
```

## Contributing

1. [Fork it](https://github.com/cyril/opushon.rb/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
