require_relative 'syntax_error'

# Namespace for the Opushon library.
module Opushon
  # Raised if anything goes wrong while parsing a verb.
  class VerbError < SyntaxError
  end
end
