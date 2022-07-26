# -*- encoding: utf-8 -*-

$:.push File.expand_path('../lib', __FILE__)
require 'omniauth/fera/version'

Gem::Specification.new do |spec|
  spec.name          = "omniauth-fera"
  spec.version       = OmniAuth::Fera::VERSION
  spec.authors       = ["Fera Commerce Inc"]
  spec.email         = ["developers@fera.ai"]

  spec.summary       = "Omniauth strategy for Fera apps."
  spec.description   = "Omniauth strategy for Fera apps."
  spec.homepage      = "https://www.fera.ai"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.files         = `git ls-files`.split("\n")
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.required_ruby_version = '>= 2.1.9'

  spec.add_runtime_dependency 'omniauth-oauth2', '~> 1'
  spec.add_runtime_dependency 'activesupport'
end

