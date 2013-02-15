# JenkinsTracker

`jenkins_tracker` is a command line utility packaged as a [RubyGem](https://rubygems.org) that integrates [Jenkins](http://jenkins-ci.org/) build information with
the relevant [Pivotal Tracker](https://www.pivotaltracker.com) stories within a project.

It's ideally run as a Post Build Action in Jenkins.

This utility makes some very specific assumptions about your Jenkins environment:-

* Git as your SCM via the [Jenkins Git Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin).

* The Jenkins build changelog file is available at `$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml`.

* Ability to execute Ruby scripts.


The following are required for your Pivotal Tracker project:-

* [API access enabled](https://www.pivotaltracker.com/help/api) (enabled by default).


## Installation

Add this line to your application's Gemfile:

    gem 'jenkins_tracker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jenkins_tracker


## Usage

TODO: Write usage instructions here


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
