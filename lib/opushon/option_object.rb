require_relative 'parameter'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class OptionObject
    def initialize( title:        '',
                    description:  '',
                    parameters:   {},
                    examples:     {} )

      @title          = title.to_s
      @description    = description.to_s

      @input_params   = Parameter::Input.load parameters.fetch(:input)   { nil }
      @output_params  = Parameter::Output.load parameters.fetch(:output) { nil }

      @input_example  = examples.fetch(:input)                           { nil }
      @output_example = examples.fetch(:output)                          { nil }

      freeze
    end

    # Dump option object's members to a hash.
    def to_h
      {
        title:        @title,
        description:  @description,
        parameters: { input:  @input_params,
                      output: @output_params },
        examples:   { input:  @input_example,
                      output: @output_example }
      }
    end
  end
end
