# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rgb/version'

Gem::Specification.new do |spec|
  spec.name          = 'rgb'
  spec.version       = RGB::VERSION
  spec.authors       = ["Dzmitry Plashchynski"]
  spec.email         = ["plashchynski@gmail.com"]

  spec.description = spec.summary = %q{A library built to handle the easy conversion, comparison and manipulation of colors with CSS-style hex color notation.}
  spec.homepage      = 'https://github.com/plashchynski/rgb'
  spec.license       = 'Apache-2.0'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.8'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec'
end
