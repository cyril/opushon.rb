# Namespace for the Opushon library.
module Opushon
  # Gem version
  VERSION = File.open(
    Pathname.new(__FILE__).join '..', '..', '..', 'VERSION.semver'
  ).read.chomp.to_sym
end
