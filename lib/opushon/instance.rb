# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class Instance
    def initialize(opushon)
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
