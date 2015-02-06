# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kumadori/version'

Gem::Specification.new do |spec|
  spec.name          = "kumadori"
  spec.version       = Kumadori::VERSION
  spec.authors       = ["Arakaki-Yuji"]
  spec.email         = ["arakaki@ryukyu-i.co.jp"]
  spec.summary       = %q{This is simple decorator for ruby}
  spec.description   = %q{This is simple decorator for ruby}
  spec.homepage      = "https://github.com/Arakaki-Yuji/kumadori"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency 'activesupport', "~> 4.1.6"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
