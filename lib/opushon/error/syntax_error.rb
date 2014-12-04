require_relative 'base_error'

# Namespace for the Opushon library.
module Opushon
  # Raised if anything goes wrong while parsing a string.
  class SyntaxError < BaseError
  end
end
