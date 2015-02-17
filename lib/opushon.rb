require 'virtus'
require 'json'
require_relative File.join 'opushon', 'body'

# Namespace for the Opushon library.
#
# @api private
module Opushon
  class << self
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
    def load(opushon_string)
      opushon_hash = JSON.load(opushon_string)
      Body.new(opushon_hash)
    end

    # Dump Ruby object to a Opushon string.
    #
    # @api public
    #
    # @param [Body] opushon
    #
    # @return [String] the Opushon data representation
    def dump(opushon)
      opushon.to_h.to_json
    end
  end
end
