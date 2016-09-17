# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'i18n/env/config'

Gem::Specification.new do |spec|
  spec.name          = "i18n-env-config"
  spec.version       = I18n::Env::Config::VERSION
  spec.authors       = ["sshaw"]
  spec.email         = ["skye.shaw@gmail.com"]

  spec.summary       = %q{I18n.default_locale based on locale environment variables}
  spec.description   = %q{An I18n config class that looks at the LANGUAGE, LC_ALL, LC_MESSAGES, and LOCALE environment variables to determine the default locale}
  spec.homepage      = "https://github.com/sshaw/i18n-env-config"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n", "~> 0.5"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
