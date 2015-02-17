require_relative 'restricted_value'

module Opushon
  class Parameter
    include Virtus.model(strict: true)

    attribute :title,             String,                 default: '',        required: true
    attribute :description,       String,                 default: '',        required: true
    attribute :type,              String,                 default: 'string',  required: true
    attribute :nullifiable,       Boolean,                default: true,      required: true
    attribute :restricted_values, Array[RestrictedValue],                     required: false
    attribute :example,           BasicObject,                                required: false
    attribute :minlen,            Fixnum,                                     required: false
    attribute :maxlen,            Fixnum,                                     required: false
    attribute :pattern,           Regexp,                                     required: false
    attribute :min,               Fixnum,                                     required: false
    attribute :max,               Fixnum,                                     required: false

    def to_h
      h = {
        title:              @title,
        description:        @description,
        type:               @type,
        nullifiable:        @nullifiable,
        restricted_values:  maybe_to_a(@restricted_values),
        example:            @example
      }

      if @type.eql?('string')
        h.update(
          minlen:   @minlen,
          maxlen:   @maxlen,
          pattern:  (@pattern.nil? ? nil : @pattern.to_s)
        )
      end

      if @type.eql?('number')
        h.update(
          min: @min,
          max: @max
        )
      end
    end

    private

    def maybe_to_a(object)
      if object.nil?
        nil
      else
        object.map(&:to_h)
      end
    end
  end
end
