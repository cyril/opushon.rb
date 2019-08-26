# frozen_string_literal: true

Gem::Specification.new do |spec|
  spec.name          = 'opushon'
  spec.version       = File.read('VERSION.semver').chomp
  spec.authors       = ['Cyril Kato']
  spec.email         = ['contact@cyril.email']

  spec.summary       = 'A HTTP Opushon parser and emitter'
  spec.description   = "An Opushon's body parser and emitter."
  spec.homepage      = 'https://github.com/cyril/opushon.rb'
  spec.license       = 'MIT'

  spec.files         =
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^test/}) }
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',    '~> 2.0'
  spec.add_development_dependency 'rake',       '~> 12.3'
  spec.add_development_dependency 'simplecov',  '~> 0.17'
  spec.add_development_dependency 'rubocop',    '~> 0.74'
  spec.add_development_dependency 'spectus',    '~> 3.0'
end
