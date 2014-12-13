# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/addins/version'

Gem::Specification.new do |spec|
  spec.name          = "capistrano-addins"
  spec.version       = Capistrano::Addins::VERSION
  spec.authors       = ["Vlad Verestiuc"]
  spec.email         = ["verestiuc.vlad@gmail.com"]
  spec.summary       = %q{Capistrano Extensions}
  spec.description   = %q{Capistrano Extensions}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
