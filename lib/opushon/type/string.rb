require_relative 'base'

# Namespace for the Opushon library.
module Opushon
  module Type
    # The type string.
    class String < Base
      def initialize(constraints)
        @minlen  = constraints.delete('minlen')   { nil }
        @maxlen  = constraints.delete('maxlen')   { nil }
        @pattern = constraints.delete('pattern')  { nil }
      end

      def default
        ''
      end

      def to_h
        super.merge({
          'minlen'  => @minlen,
          'maxlen'  => @maxlen,
          'pattern' => @pattern
        })
      end
    end
  end
end
