# Namespace for the Opushon library.
module Opushon
  # Contains available types.
  module Type
  end
end

Dir[File.join File.dirname(__FILE__), 'type', '*.rb'].each do |filename|
  require_relative filename
end
