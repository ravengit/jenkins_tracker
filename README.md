# JenkinsTracker

[![Build Status](https://travis-ci.org/prashantrajan/jenkins_tracker.png?branch=master)](https://travis-ci.org/prashantrajan/jenkins_tracker)
[![Gem Version](https://badge.fury.io/rb/jenkins_tracker.png)](http://badge.fury.io/rb/jenkins_tracker)

`jenkins_tracker` is a command line utility packaged as a [RubyGem](https://rubygems.org) that integrates [Jenkins](http://jenkins-ci.org/) build information with
the relevant [Pivotal Tracker](https://www.pivotaltracker.com) stories within a project.

This utility makes some very specific assumptions about your Jenkins environment:-

* Git as your SCM via the [Jenkins Git Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin).

* The Jenkins build changelog file is available at `$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml`.
  The changelog contents look like this [example](https://github.com/prashantrajan/jenkins_tracker/blob/master/spec/fixtures/git_changelog.txt).

* Ability to execute Ruby 1.9.x scripts.

* Environment variables exists for `$JENKINS_HOME`, `$JOB_NAME`, `$BUILD_NUMBER` & `$BUILD_URL`.


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

    # Assuming environment variables for $JENKINS_HOME, $JOB_NAME, $BUILD_NUMBER & $BUILD_URL exists
    $ bundle exec jenkins_tracker integrate --tracker-token ABC123456 --tracker-project-id 123456
      # => Successfully integrated Jenkins Job ($JOB_NAME) with Pivotal Tracker Project (123456)

It's best to run this utility as a Post Build Action in Jenkins:

![Jenkins Post Build Action Screenshot](https://raw.github.com/prashantrajan/static_assets/master/jenkins_tracker/images/jenkins_post_build_action.jpg)

The integration will result in comments being added to the relevant Pivotal Tracker stories:

![Jenkins Post Build Action Screenshot](https://raw.github.com/prashantrajan/static_assets/master/jenkins_tracker/images/tracker_comment.jpg)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
