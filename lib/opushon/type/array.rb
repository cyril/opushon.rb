require_relative 'base'

# Namespace for the Opushon library.
module Opushon
  module Type
    # The type number.
    class Array < Base
      def default
        []
      end
    end
  end
end
