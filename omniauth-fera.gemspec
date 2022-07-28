# -*- encoding: utf-8 -*-

$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/fera/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-fera"
  spec.version       = OmniAuth::Fera::VERSION
  spec.authors       = ["Fera Commerce Inc"]
  spec.email         = ["developers@fera.ai"]

  spec.summary       = "OmniAuth strategy for Fera apps."
  spec.description   = "OmniAuth strategy for Fera apps."
  spec.homepage      = "https://www.fera.ai"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']


  spec.add_dependency "bundler", ">= 1.15.0"

  spec.add_runtime_dependency 'omniauth', '>= 1.9'
  spec.add_runtime_dependency 'omniauth-oauth2', '>= 1'
  spec.add_runtime_dependency 'activesupport'
end

