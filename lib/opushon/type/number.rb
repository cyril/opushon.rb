require_relative 'base'

# Namespace for the Opushon library.
module Opushon
  module Type
    # The type number.
    class Number < Base
      def initialize(constraints)
        @min  = constraints.delete('min')   { nil }
        @max  = constraints.delete('max')   { nil }
        @step = constraints.delete('step')  { nil }
      end

      def default
        0
      end

      def to_h
        super.merge({
          'min'   => @min,
          'max'   => @max,
          'step'  => @step
        })
      end
    end
  end
end
