require_relative File.join(*%w(opushon instance))
require_relative File.join(*%w(opushon version))

# Namespace for the Opushon library.
#
# @api private
module Opushon
  class << self
    # Load opushon in to a Ruby data structure.
    # @api public
    def load(opushon)
      Instance.new(opushon)
    end

    # Dump Ruby object o to a Opushon string.
    # @api public
    def dump(o)
      '{"DELETE":{"title":"Delete issues","description":"Remove every issues."}}'
    end
  end
end
