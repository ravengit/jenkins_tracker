# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jenkins_tracker/version'

Gem::Specification.new do |gem|
  gem.add_development_dependency 'rake', '>= 0.8'
  gem.add_development_dependency 'rspec', '~> 2.12'

  gem.name          = "jenkins_tracker"
  gem.version       = JenkinsTracker::VERSION
  gem.authors       = ["Prashant Nadarajan"]
  gem.email         = ["prashant.nadarajan@gmail.com"]
  gem.description   = %q{TODO: Write a gem description}
  gem.summary       = %q{TODO: Write a gem summary}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end