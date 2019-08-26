# frozen_string_literal: true

module Opushon
  # If present, the value of restricted_values is an array where each item
  #   contains a hash.
  class RestrictedValue
    def self.load(hash)
      raise ArgumentError, "hash #{hash.inspect}" unless hash.is_a?(Hash)

      title       = hash.fetch('title',       nil)
      description = hash.fetch('description', nil)
      value       = hash.fetch('value',       nil)

      hash = {
        title:        title,
        description:  description,
        value:        value
      }.compact

      new(**hash)
    end

    attr_reader :title, :description, :value

    def initialize(title: '', description: '', value:)
      raise ArgumentError, "title #{title.inspect}"             unless title.is_a?(String)
      raise ArgumentError, "description #{description.inspect}" unless description.is_a?(String)
      raise ArgumentError, "value #{value.inspect}"             unless value.is_a?(BasicObject)

      @title        = title
      @description  = description
      @value        = value
    end

    def to_h
      {
        title:        title,
        description:  description,
        value:        value
      }
    end
  end
end
