require_relative 'attribute'
require_relative 'verb'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class OptionObject
    def initialize(verb, members)
      @verb           = verb
      @title          = members.delete('title')         { '' }
      @description    = members.delete('description')   { '' }

      @query_string   = {}
      query_string    = members.delete('query_string')  { Hash.new }
      query_string.each do |key, properties|
        @query_string.update key => Attribute.new(properties)
      end

      @parameters     = {}
      parameters      = members.delete('parameters')    { Hash.new }
      parameters.each do |key, properties|
        @parameters.update key => Attribute.new(properties)
      end

      @example        = members.delete('example')       { nil }

      unless @example.nil?
        fail InvalidExample unless valid?(@example)
      end

      @other_settings = members
    end

    # Dump option object's members to a hash.
    def to_h
      {
        'title'         => @title,
        'description'   => @description,
        'query_string'  => @query_string.each { |k,v| @query_string[k] = v.to_h },
        'parameters'    => @parameters.each   { |k,v| @parameters[k]   = v.to_h },
        'example'       => @example
      }.merge(@other_settings)
    end

    # Runs all the validations within the current context.
    #
    # @return [Boolean] Returns true if no errors are found, false otherwise.
    def valid?(example)
      unless VERBS.include?(@verb.to_sym)
        fail VerbError
      end

      true
    end
  end
end
