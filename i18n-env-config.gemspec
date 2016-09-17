# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = "i18n-env-config"
  spec.version       = "0.0.1"
  spec.authors       = ["Skye Shaw"]
  spec.email         = ["skye.shaw@gmail.com"]

  spec.summary       = %q{Set I18n.locale based on the environment variables that control the locale}
  spec.description   = %q{An I18n config class that looks at the LANGUAGE, LC_ALL, LC_MESSAGES, and LOCALE environment variables to determine I18n.locale}
  spec.homepage      = "https://github.com/sshaw/i18n-env-config"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n", "~> 0.5"
  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
