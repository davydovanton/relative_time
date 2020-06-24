# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'relative_time/version'

Gem::Specification.new do |spec|
  spec.name          = "relative_time"
  spec.version       = RelativeTime::VERSION
  spec.authors       = ["Anton Davydov"]
  spec.email         = ["antondavydov.o@gmail.com"]

  spec.summary       = %q{Micro lib without any dependency for getting relative time}
  spec.description   = %q{Micro lib without any dependency for getting relative time}
  spec.homepage      = "https://github.com/davydovanton/relative_time"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end

  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "i18n"

  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 12.3.3"
  spec.add_development_dependency "minitest", "~> 5.0"
end
