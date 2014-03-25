# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'radix_tree/version'

Gem::Specification.new do |spec|
  spec.name = 'radix_tree'
  spec.version = RadixTree::VERSION
  spec.authors = ['asharlaimov']
  spec.email = ['sgnllsa@gmail.com']
  spec.summary = %q{Radix Tree Store.}
  spec.description = %q{Radix Tree Store.}
  spec.homepage = ''
  spec.license = 'MIT'

  spec.files = `git ls-files -z`.split('\x0')
  spec.executables = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.5'
  spec.add_development_dependency 'rake'
end


#gem build radix_tree.gemspec
#http://www.sitepoint.com/creating-your-first-gem/
