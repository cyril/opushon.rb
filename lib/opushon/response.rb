# frozen_string_literal: true

require_relative 'parameter'

module Opushon
  class Response
    include Virtus.model(strict: true)

    attribute :headers, Hash[Symbol => Parameter], default: {}, required: true
    attribute :body,    Hash[Symbol => Parameter], default: {}, required: true

    def to_h
      {
        headers:  @headers.map { |k, v| [k, v.to_h] }.to_h,
        body:     @body.map    { |k, v| [k, v.to_h] }.to_h
      }
    end
  end
end
