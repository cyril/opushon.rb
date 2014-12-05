require_relative 'option'
require_relative 'option_object'
require_relative 'verb'
require 'json'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class Instance
    def initialize(opushon)
      o = JSON.load opushon

      unless o.is_a?(Hash)
        fail SyntaxError
      end

      unless o.keys.map(&:to_sym).to_set.subset? VERBS
        fail VerbError
      end

      @options = {}
      o.each do |verb, option_object|
        @options.update verb => OptionObject.new(verb, option_object)
      end
    end

    # Dump instance's opushon to a hash.
    #
    # @api public
    def to_h
      Hash[@options.each { |k,v| @options[k] = v.to_h }]
    end

    # Runs all the validations within the current context.
    #
    # @return [Boolean] Returns true if no errors are found, false otherwise.
    #
    # @api public
    def valid?(verb, example)
      @options.fetch(verb.to_s).valid? example
    end
  end
end
