module Opushon
  # Namespace for parameters parsing.
  module Parameter
  end
end

Dir[File.join File.dirname(__FILE__), 'parameter', '*.rb'].each do |filename|
  require_relative filename
end
