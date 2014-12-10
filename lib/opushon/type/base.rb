# Namespace for the Opushon library.
module Opushon
  module Type
    # Abstract class.
    class Base
      def initialize(*)
        freeze
      end

      def to_h
        {
          type: to_sym
        }.merge(constraints)
      end

      def to_sym
        self.class.name.split('::').last.downcase
      end

      def constraints
        {}
      end
    end
  end
end
