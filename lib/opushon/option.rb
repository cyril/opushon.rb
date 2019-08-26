# frozen_string_literal: true

require_relative 'request'
require_relative 'response'

module Opushon
  class Option
    include Virtus.model(strict: true)

    attribute :title,       String,   default: '',            required: true
    attribute :description, String,   default: '',            required: true
    attribute :request,     Request,  default: Request.new,   required: true
    attribute :response,    Response, default: Response.new,  required: true

    def to_h
      {
        title:        @title,
        description:  @description,
        request:      @request.to_h,
        response:     @response.to_h
      }
    end
  end
end
