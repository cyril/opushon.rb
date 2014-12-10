require_relative 'option_object'
require_relative 'verb'
require 'json'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class Instance
    def initialize(opushon)
      o = JSON.parse(opushon, symbolize_names: true)

      unless o.is_a?(Hash)
        fail SyntaxError
      end

      unless o.keys.to_set.subset? VERBS
        fail VerbError
      end

      @options = {}
      o.each do |verb, option_object|
        option_object_sym = JSON.parse(option_object.to_json, symbolize_names: true)
        @options.update verb => OptionObject.new(option_object_sym)
      end
    end

    # Dump instance's opushon to a hash.
    #
    # @api public
    def to_h
      Hash[@options.each { |k,v| @options[k] = v.to_h }]
    end
  end
end
