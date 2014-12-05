# Namespace for the Opushon library.
module Opushon
  module Type
    # Abstract class.
    class Base
      def default
        nil
      end

      def to_h
        {
          'default' => default,
          'type'    => self.class.name.split('::').last.downcase
        }
      end
    end
  end
end
