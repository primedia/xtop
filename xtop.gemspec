# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'xtop/version'

Gem::Specification.new do |spec|
  spec.name          = "xtop"
  spec.version       = Xtop::VERSION
  spec.authors       = ["Jack Morrill", "Eric Toulson", "Edward Leung", "Tyler Long", "Tyler Boyd"]
  spec.email         = ["IWS_ADMIN@rentpath.com"]
  spec.summary       = %q{Command-line dashboard for external services}
  spec.description   = %q{Command-line dashboard for external services}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  #spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
