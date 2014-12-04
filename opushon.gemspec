Gem::Specification.new do |spec|
  spec.name          = 'opushon'
  spec.version       = File.read('VERSION.semver')
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.email']
  spec.summary       = 'A HTTP Opushon parser and emitter'
  spec.description   = 'An Opushon\'s body parser and emitter.'
  spec.homepage      = 'https://github.com/cyril/opushon.rb'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(/^spec\//)
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.0.0'

  spec.add_development_dependency 'bundler',    '~> 1.7'
  spec.add_development_dependency 'minitest',   '~> 5'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'coveralls',  '~> 0.7'
end
