require_relative 'base'
require_relative File.join '..', 'restricted_value'

# Namespace for the Opushon library.
module Opushon
  module Parameter
  # Parse a Opushon input.
    class Input < Base
      def initialize( query_string:       true,
                      restricted_values:  nil,
                      title:              '',
                      description:        '',
                      nullifiable:        true,
                      type:               'string', **type_properties )

        @query_string       = query_string
        @restricted_values  = RestrictedValue.load_list(restricted_values)

        @title        = title.to_s
        @description  = description.to_s
        @nullifiable  = nullifiable
        @type         = Type.const_get(type.capitalize).new(type_properties)
      end

      # Dump attribute's properties to a hash.
      def to_h
        {
          query_string:       @query_string,
          restricted_values:  @restricted_values
        }.merge(super).merge(@type.constraints)
      end
    end
  end
end
