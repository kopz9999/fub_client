# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fub_client/version'

Gem::Specification.new do |spec|
  spec.name          = "fub_client"
  spec.version       = FubClient::VERSION
  spec.authors       = ["Kyoto Kopz"]
  spec.email         = ["kopz9999@gmail.com"]

  spec.summary       = 'Ruby client for Follow Up Boss API http://www.followupboss.com'
  # spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.homepage      = "https://github.com/kopz9999/fub_client"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "https://rubygems.org"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "her", "~> 0.8.1"
  spec.add_dependency "faraday", ">= 0.8", '<= 0.9.2'

  # Developemnt
  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "dotenv", '>= 2.1.1'
  spec.add_development_dependency "vcr", '>= 3.0.3'
  spec.add_development_dependency "webmock", '>= 2.1.0'
  spec.add_development_dependency "pry", ">= 0.10.3"
end
