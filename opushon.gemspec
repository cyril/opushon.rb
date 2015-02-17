Gem::Specification.new do |spec|
  spec.name          = 'opushon'
  spec.version       = File.read('VERSION.semver')
  spec.authors       = ['Cyril Wack']
  spec.email         = ['contact@cyril.email']

  spec.summary       = 'A HTTP Opushon parser and emitter'
  spec.description   = 'An Opushon\'s body parser and emitter.'
  spec.homepage      = 'https://github.com/cyril/opushon.rb'
  spec.license       = 'MIT'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(/^test\//) }
  spec.executables   = spec.files.grep(/^exe\//) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'virtus',                 '~> 1.0.4'

  spec.add_development_dependency 'bundler',    '~> 1.8'
  spec.add_development_dependency 'rake',       '~> 10.0'
  spec.add_development_dependency 'yard',       '~> 0.8'
  spec.add_development_dependency 'simplecov',  '~> 0.9.1'
  spec.add_development_dependency 'rubocop',    '~> 0.29'
  spec.add_development_dependency 'expect',     '~> 0.0.6'
end
