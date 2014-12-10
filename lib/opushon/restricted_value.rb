# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class RestrictedValue
    attr_reader :value

    def self.load_list(restricted_values)
      return if restricted_values.nil?

      restricted_values.map do |restricted_value|
        new(JSON.parse(restricted_value.to_json, symbolize_names: true)).to_h
      end
    end

    def initialize( title:        '',
                    description:  '',
                    value:          )

      @title        = title.to_s
      @description  = description.to_s
      @value        = value

      freeze
    end

    # Dump instance's opushon to a hash.
    def to_h
      {
        title:        @title,
        description:  @description,
        value:        @value
      }
    end
  end
end
