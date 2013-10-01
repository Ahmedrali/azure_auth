# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'azure_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "azure_auth"
  spec.version       = AzureAuth::VERSION
  spec.authors       = ["Ahmed Ali"]
  spec.email         = ["ahmedrali2@gmail.com"]
  spec.date          = "2013-10-01"
  spec.summary       = "azure_auth uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc."
  spec.description   = "azure_auth uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc."
  spec.homepage      = "https://github.com/Ahmedrali/azure_auth"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
end
