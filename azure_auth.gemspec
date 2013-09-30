# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'azure_auth/version'

Gem::Specification.new do |spec|
  spec.name          = "azure_auth"
  spec.version       = AzureAuth::VERSION
  spec.authors       = ["Ahmed Ali"]
  spec.email         = ["ahmedrali2@gmail.com"]
  spec.date          = "2013-09-30"
  spec.summary       = "omniauth-azure-ad uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc."
  spec.description   = "omniauth-azure-ad uses 'Peerialism authentication HUB' web site that manages token exchanges with the Azure ACS, encryption etc."
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rails"
end
