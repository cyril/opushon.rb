# frozen_string_literal: true

require_relative 'option'

module Opushon
  # The body structure is a hash where each key is a HTTP method and each value
  # is a sub-hash, called an option object.
  class Body
    def self.load(hash)
      raise ArgumentError, "hash #{hash.inspect}" unless hash.is_a?(Hash)

      get     = hash.fetch('GET',     nil)
      patch   = hash.fetch('PATCH',   nil)
      put     = hash.fetch('PUT',     nil)
      post    = hash.fetch('POST',    nil)
      delete  = hash.fetch('DELETE',  nil)

      hash = {
        get:    get,
        patch:  patch,
        put:    put,
        post:   post,
        delete: delete
      }.compact

      new(**hash)
    end

    attr_reader :get, :patch, :put, :post, :delete

    def initialize(get: nil, patch: nil, put: nil, post: nil, delete: nil)
      unless get.nil?
        raise ArgumentError, "get #{get.inspect}" unless get.is_a?(Hash)
      end

      unless patch.nil?
        raise ArgumentError, "patch #{patch.inspect}" unless patch.is_a?(Hash)
      end

      unless put.nil?
        raise ArgumentError, "put #{put.inspect}" unless put.is_a?(Hash)
      end

      unless post.nil?
        raise ArgumentError, "post #{post.inspect}" unless post.is_a?(Hash)
      end

      unless delete.nil?
        raise ArgumentError, "delete #{delete.inspect}" unless delete.is_a?(Hash)
      end

      @get    = Option.load(get)    unless get.nil?
      @patch  = Option.load(patch)  unless patch.nil?
      @put    = Option.load(put)    unless put.nil?
      @post   = Option.load(post)   unless post.nil?
      @delete = Option.load(delete) unless delete.nil?
    end

    def to_h
      {
        GET:    maybe_to_h(get),
        PATCH:  maybe_to_h(patch),
        PUT:    maybe_to_h(put),
        POST:   maybe_to_h(post),
        DELETE: maybe_to_h(delete)
      }.compact
    end

    private

    def maybe_to_h(object)
      object&.to_h
    end
  end
end
