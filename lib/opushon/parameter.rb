# frozen_string_literal: true

require_relative 'restricted_value'

module Opushon
  # The content of headers, query string and body params MUST be described with
  #   the keys below. When a key is missing, its default value is assigned.
  class Parameter
    include Virtus.model(strict: true)

    attribute :title,             String,                 default: '',        required: true
    attribute :description,       String,                 default: '',        required: true
    attribute :type,              String,                 default: 'string',  required: true
    attribute :nullifiable,       Boolean,                default: true,      required: true
    attribute :restricted_values, Array[RestrictedValue],                     required: false
    attribute :example,           BasicObject,                                required: false
    attribute :minlen,            Integer,                                    required: false
    attribute :maxlen,            Integer,                                    required: false
    attribute :pattern,           Regexp,                                     required: false
    attribute :min,               Integer,                                    required: false
    attribute :max,               Integer,                                    required: false

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
          pattern:  @pattern&.to_s
        )
      end

      if @type.eql?('number')
        h.update(
          min: @min,
          max: @max
        )
      end

      h
    end

    private

    def maybe_to_a(object)
      return if object.nil?

      object.map(&:to_h)
    end
  end
end
