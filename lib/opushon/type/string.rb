require_relative 'base'

# Namespace for the Opushon library.
module Opushon
  module Type
    # The type string.
    class String < Base
      def initialize( minlen:   nil,
                      maxlen:   nil,
                      pattern:  nil )

        if !minlen.nil? && !maxlen.nil?
          fail MinlenIsLongerThanMaxlenError if minlen > maxlen
        end

        @minlen   = minlen
        @maxlen   = maxlen
        @pattern  = pattern

        freeze
      end

      def constraints
        {
          minlen:   @minlen,
          maxlen:   @maxlen,
          pattern:  @pattern
        }
      end
    end
  end
end
