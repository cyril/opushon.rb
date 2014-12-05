# Namespace for the Opushon library.
module Opushon
  # Parse a Opushon string in opushon.
  class Option
    def initialize(option_object)
      @option_object = option_object
    end

    # Dump instance's opushon to a hash.
    def to_h
      @option_object.to_h
    end
  end
end
