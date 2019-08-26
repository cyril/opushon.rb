# frozen_string_literal: true

require_relative 'parameter'

module Opushon
  class Response
    def self.load(hash)
      raise ArgumentError, "hash #{hash.inspect}" unless hash.is_a?(Hash)

      headers = hash.fetch('headers', nil)
      body    = hash.fetch('body',    nil)

      hash = {
        headers:  headers,
        body:     body
      }.compact

      new(**hash)
    end

    attr_reader :headers, :body

    def initialize(headers: {}, body: {})
      raise ArgumentError, "headers #{headers.inspect}" unless headers.is_a?(Hash)
      raise ArgumentError, "body #{body.inspect}"       unless body.is_a?(Hash)

      @headers  = headers.map { |k, v| [k.to_sym, Parameter.load(v)] }.to_h
      @body     = body.map    { |k, v| [k.to_sym, Parameter.load(v)] }.to_h
    end

    def to_h
      {
        headers:  headers.map { |k, v| [k, v.to_h] }.to_h,
        body:     body.map    { |k, v| [k, v.to_h] }.to_h
      }
    end
  end
end
