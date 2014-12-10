require_relative File.join '..', 'type'

# Namespace for the Opushon library.
module Opushon
  module Parameter
    # Abstract class.
    class Base
      def self.load(input_or_output_params)
        if input_or_output_params.nil?
          @input_or_output_params = nil
        else
          @input_or_output_params = {}

          input_or_output_params.each do |key, properties|
            properties_sym = JSON.parse(properties.to_json, symbolize_names: true)
            @input_or_output_params.update key.to_sym => new(properties_sym).to_h
          end
        end

        @input_or_output_params
      end

      def initialize( title:              '',
                      description:        '',
                      nullifiable:        true,
                      type:               'string', **type_properties )

        @title        = title.to_s
        @description  = description.to_s
        @nullifiable  = nullifiable
        @type         = Type.const_get(type.capitalize).new(type_properties)

        freeze
      end

      # Dump attribute's properties to a hash.
      def to_h
        {
          title:        @title,
          description:  @description,
          nullifiable:  @nullifiable,
          type:         @type.to_sym
        }
      end
    end
  end
end
