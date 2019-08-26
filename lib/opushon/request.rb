# frozen_string_literal: true

require_relative 'parameter'

module Opushon
  class Request
    def self.load(hash)
      raise ArgumentError, "hash #{hash.inspect}" unless hash.is_a?(Hash)

      headers       = hash.fetch('headers',       nil)
      query_string  = hash.fetch('query_string',  nil)
      body          = hash.fetch('body',          nil)

      hash = {
        headers:      headers,
        query_string: query_string,
        body:         body
      }.compact

      new(**hash)
    end

    attr_reader :headers, :query_string, :body

    def initialize(headers: {}, query_string: {}, body: {})
      raise ArgumentError, "headers #{headers.inspect}"           unless headers.is_a?(Hash)
      raise ArgumentError, "query_string #{query_string.inspect}" unless query_string.is_a?(Hash)
      raise ArgumentError, "body #{body.inspect}"                 unless body.is_a?(Hash)

      @headers      = headers.map       { |k, v| [k.to_sym, Parameter.load(v)] }.to_h
      @query_string = query_string.map  { |k, v| [k.to_sym, Parameter.load(v)] }.to_h
      @body         = body.map          { |k, v| [k.to_sym, Parameter.load(v)] }.to_h
    end

    def to_h
      {
        headers:      headers.map       { |k, v| [k, v.to_h] }.to_h,
        query_string: query_string.map  { |k, v| [k, v.to_h] }.to_h,
        body:         body.map          { |k, v| [k, v.to_h] }.to_h
      }
    end
  end
end
