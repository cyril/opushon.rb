require_relative 'base_error'

# Namespace for the Opushon library.
module Opushon
  # Raised if min is greater than max.
  class MinIsGreaterThanMaxError < BaseError
  end
end
