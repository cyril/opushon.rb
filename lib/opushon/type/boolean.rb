require_relative 'base'

# Namespace for the Opushon library.
module Opushon
  module Type
    # The type boolean.
    class Boolean < Base
      def default
        false
      end
    end
  end
end
