require_relative 'exception'

# Namespace for the Opushon library.
module Opushon
  # Raised if anything goes wrong while parsing a string.
  class SyntaxError < Opushon::Exception
  end
end
