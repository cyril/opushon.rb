require 'set'

Dir[File.join File.dirname(__FILE__), 'verb', '*.rb'].each do |filename|
  require_relative filename
end

# Namespace for the Opushon library.
module Opushon
  # Allowed verbs
  VERBS = Verb.constants.delete_if { |sym| sym.equal?(:Base) }.map(&:upcase).to_set
end
