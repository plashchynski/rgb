# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rgb/version'

Gem::Specification.new do |spec|
  spec.name          = 'rgb'
  spec.version       = RGB::VERSION
  spec.authors       = ['Dzmitry Plashchynski']
  spec.email         = ['plashchynski@gmail.com']

  spec.description   = %q{A library built to handle the easy conversion, comparison and manipulation of colors with CSS-style hex color notation.}
  spec.summary       = spec.description
  spec.homepage      = 'https://github.com/plashchynski/rgb'
  spec.license       = 'Apache-2.0'

  spec.files         = Dir.glob("{lib}/**/*", File::FNM_DOTMATCH).reject { |f| File.directory?(f) || f =~ %r{^(test|spec|features)/} }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler',   '~> 2.5.9'
  spec.add_development_dependency 'rake',      '~> 13.1.0'
  spec.add_development_dependency 'rspec',     '~> 3.13.0'
  spec.add_development_dependency 'simplecov', '~> 0.22.0'
end
