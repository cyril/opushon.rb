require_relative 'syntax_error'
require 'json'

# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  #
  # Raises a Opushon::SyntaxError when a Opushon syntax error is detected.
  class Instance
    def initialize(opushon)
      o = JSON.load opushon

      if o.is_a?(Array)
        fail SyntaxError
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
