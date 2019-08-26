# frozen_string_literal: true

require_relative 'restricted_value'

module Opushon
  # The content of headers, query string and body params MUST be described with
  #   the keys below. When a key is missing, its default value is assigned.
  class Parameter
    def self.load(hash)
      raise ArgumentError, "hash #{hash.inspect}" unless hash.is_a?(Hash)

      title             = hash.fetch('title',             nil)
      description       = hash.fetch('description',       nil)
      type              = hash.fetch('type',              nil)
      nullifiable       = hash.fetch('nullifiable',       nil)
      restricted_values = hash.fetch('restricted_values', nil)
      example           = hash.fetch('example',           nil)
      minlen            = hash.fetch('minlen',            nil)
      maxlen            = hash.fetch('maxlen',            nil)
      pattern           = hash.fetch('pattern',           nil)
      min               = hash.fetch('min',               nil)
      max               = hash.fetch('max',               nil)

      hash = {
        title:              title,
        description:        description,
        type:               type,
        nullifiable:        nullifiable,
        restricted_values:  restricted_values,
        example:            example,
        minlen:             minlen,
        maxlen:             maxlen,
        pattern:            pattern,
        min:                min,
        max:                max
      }.compact

      new(**hash)
    end

    attr_reader :title, :description, :type, :nullifiable, :restricted_values, :example, :minlen, :maxlen, :pattern, :min, :max

    def initialize(title: '', description: '', type: 'string', nullifiable: true, restricted_values: nil, example: nil, minlen: nil, maxlen: nil, pattern: nil, min: nil, max: nil)
      raise ArgumentError, "title #{title.inspect}"             unless title.is_a?(String)
      raise ArgumentError, "description #{description.inspect}" unless description.is_a?(String)
      raise ArgumentError, "type #{type.inspect}"               unless type.is_a?(String)
      raise ArgumentError, "nullifiable #{nullifiable.inspect}" unless [false, true].include?(nullifiable)

      unless restricted_values.nil?
        raise ArgumentError, "restricted_values #{restricted_values.inspect}" unless restricted_values.is_a?(Array)
      end

      unless example.nil?
        raise ArgumentError, "example #{example.inspect}" unless example.is_a?(BasicObject)
      end

      unless minlen.nil?
        raise ArgumentError, "minlen #{minlen.inspect}" unless minlen.is_a?(Integer)
      end

      unless maxlen.nil?
        raise ArgumentError, "maxlen #{maxlen.inspect}" unless maxlen.is_a?(Integer)
      end

      unless pattern.nil?
        raise ArgumentError, "pattern #{pattern.inspect}" unless pattern.is_a?(String)
      end

      unless min.nil?
        raise ArgumentError, "min #{min.inspect}" unless min.is_a?(Integer)
      end

      unless max.nil?
        raise ArgumentError, "max #{max.inspect}" unless max.is_a?(Integer)
      end

      @title              = title
      @description        = description
      @type               = type
      @nullifiable        = nullifiable
      @restricted_values  = restricted_values.map { |restricted_value| RestrictedValue.load(restricted_value) } unless restricted_values.nil?
      @example            = example
      @minlen             = minlen
      @maxlen             = maxlen
      @pattern            = Regexp.new(pattern) unless pattern.nil?
      @min                = min
      @max                = max
    end

    def to_h
      h = {
        title:              title,
        description:        description,
        type:               type,
        nullifiable:        nullifiable,
        restricted_values:  maybe_to_a_of_h(restricted_values),
        example:            example
      }

      if type.eql?('string')
        return h.merge(
          minlen:   minlen,
          maxlen:   maxlen,
          pattern:  pattern&.to_s
        )
      end

      if type.eql?('number')
        return h.merge(
          min: min,
          max: max
        )
      end

      h
    end

    private

    def maybe_to_a_of_h(object)
      return if object.nil?

      object.map(&:to_h)
    end
  end
end
