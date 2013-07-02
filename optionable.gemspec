# encoding: utf-8
require "./lib/optionable/version"

Gem::Specification.new do |s|
  s.name         = "optionable"
  s.version      = Optionable::VERSION
  s.platform     = Gem::Platform::RUBY
  s.authors      = ["Durran Jordan"]
  s.email        = ["durran@gmail.com"]
  s.summary      = "Robust options validation for methods."
  s.description  = s.summary
  s.files        = Dir.glob("lib/**/*") + %w(README.md LICENSE.md Rakefile)
  s.test_files   = Dir.glob("spec/**/*")
  s.require_path = "lib"
  s.required_ruby_version     = ">= 1.9.2"
  s.required_rubygems_version = ">= 1.3.6"
  s.has_rdoc                  = "yard"
end
