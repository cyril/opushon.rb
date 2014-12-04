require_relative 'verb'
require 'json'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class Instance
    def initialize(opushon)
      o = JSON.load opushon

      unless o.is_a?(Hash)
        fail SyntaxError
      end

      unless o.keys.map(&:to_sym).to_set.subset? VERBS
        fail VerbError
      end
    end

    # Dump Ruby object to a hash.
    def to_h
      {
        DELETE: {
          title:        'Delete issues',
          description:  'Remove every issues.'
        }
      }
    end
  end
end
