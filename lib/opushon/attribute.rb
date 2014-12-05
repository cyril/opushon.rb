require_relative 'type'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class Attribute
    def initialize(properties)
      type            = properties.delete('type')         { 'string' }
      @type           = Type.const_get(type.capitalize).new(properties)

      @nullifiable    = properties.delete('nullifiable')  { true }
      @multiple       = properties.delete('multiple')     { false }
      @description    = properties.delete('description')  { '' }
      @options        = properties.delete('options')      { nil }

      @other_settings = properties
    end

    # Dump attribute's properties to a hash.
    def to_h
      {
        'nullifiable' =>  @nullifiable,
        'multiple'    =>  @multiple,
        'description' =>  @description,
        'options'     =>  @options
      }.merge(@other_settings).merge(@type.to_h)
    end
  end
end
