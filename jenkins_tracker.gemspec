# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jenkins_tracker/version'

Gem::Specification.new do |gem|
  gem.name          = "jenkins_tracker"
  gem.version       = JenkinsTracker::VERSION
  gem.authors       = ["Prashant Nadarajan"]
  gem.email         = ["prashant.nadarajan@gmail.com"]
  gem.description   = %q{Integrate Jenkins build details with Pivotal Tracker stories }
  gem.summary       = %q{Send Jenkins build info as notes to the relevant Pivotal Tracker (PT) stories based on PT post commit message syntax}
  gem.homepage      = "https://github.com/prashantrajan/jenkins_tracker"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = %w(jenkins_tracker)
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_runtime_dependency 'rest-client', '~> 1.6'
  gem.add_runtime_dependency 'thor', '~> 0.15'

  gem.add_development_dependency 'rake', '>= 0.8'
  gem.add_development_dependency 'rspec', '~> 2.12'
end
