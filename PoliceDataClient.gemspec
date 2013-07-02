# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'PoliceDataClient/version'

Gem::Specification.new do |spec|
  spec.name          = "PoliceDataClient"
  spec.version       = PoliceDataClient::VERSION
  spec.authors       = ["Dave Russell"]
  spec.email         = ["dave.kerr@gmail.com"]
  spec.description   = "Ruby client for Police Data API: http://data.police.uk/"
  spec.summary       = "Ruby client for Police Data API: http://data.police.uk/"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "api_smith"
  spec.add_development_dependency "minitest"
end
