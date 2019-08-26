# frozen_string_literal: true

require_relative 'option'

module Opushon
  # The body structure is a hash where each key is a HTTP method and each value
  # is a sub-hash, called an option object.
  class Body
    include Virtus.model(strict: true)

    attribute :GET,     Option, required: false
    attribute :PATCH,   Option, required: false
    attribute :PUT,     Option, required: false
    attribute :POST,    Option, required: false
    attribute :DELETE,  Option, required: false

    def to_h
      {
        GET:    maybe_to_h(@GET),
        PATCH:  maybe_to_h(@PATCH),
        PUT:    maybe_to_h(@PUT),
        POST:   maybe_to_h(@POST),
        DELETE: maybe_to_h(@DELETE)
      }
    end

    private

    def maybe_to_h(object)
      if object.nil?
        nil
      else
        object.to_h
      end
    end
  end
end
