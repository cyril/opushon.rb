# frozen_string_literal: true

require_relative 'request'
require_relative 'response'

module Opushon
  class Option
    def self.load(hash)
      raise ArgumentError, "hash #{hash.inspect}" unless hash.is_a?(Hash)

      title       = hash.fetch('title',       nil)
      description = hash.fetch('description', nil)
      request     = hash.fetch('request',     nil)
      response    = hash.fetch('response',    nil)

      hash = {
        title:        title,
        description:  description,
        request:      request,
        response:     response
      }.compact

      new(**hash)
    end

    attr_reader :title, :description, :request, :response

    def initialize(title: '', description: '', request: {}, response: {})
      raise ArgumentError, "title #{title.inspect}"             unless title.is_a?(String)
      raise ArgumentError, "description #{description.inspect}" unless description.is_a?(String)
      raise ArgumentError, "request #{request.inspect}"         unless request.is_a?(Hash)
      raise ArgumentError, "response #{response.inspect}"       unless response.is_a?(Hash)

      @title        = title
      @description  = description
      @request      = Request.load(request)
      @response     = Response.load(response)
    end

    def to_h
      {
        title:        title,
        description:  description,
        request:      request.to_h,
        response:     response.to_h
      }
    end
  end
end
