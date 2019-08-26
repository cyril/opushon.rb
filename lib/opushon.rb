# frozen_string_literal: true

require 'json'

# Namespace for the Opushon library.
# Representation of documentations for HTTP APIs.
#
# @api private
module Opushon
  # Load opushon in to the Ruby data structure.
  #
  # @api public
  #
  # @example Load the option of a DELETE interface
  #   load('{"DELETE":{"title":"Delete issues","description":"Remove every issues.","request":{"headers":{},"query_string":{},"body":{}},"response":{"headers":{},"query_string":{},"body":{}}}}')
  #
  # @param [String] opushon_string
  #
  # @return [Body] the Ruby data structure
  def self.load(opushon_string)
    opushon_hash = JSON.parse(opushon_string)
    Body.load(opushon_hash)
  end

  # Dump Ruby object to a Opushon string.
  #
  # @api public
  #
  # @param [Body] opushon
  #
  # @return [String] the Opushon data representation
  def self.dump(opushon)
    opushon.to_h.to_json
  end
end

require_relative File.join('opushon', 'body')
