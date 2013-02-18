# JenkinsTracker

[![Build Status](https://travis-ci.org/prashantrajan/jenkins_tracker.png?branch=master)](https://travis-ci.org/prashantrajan/jenkins_tracker)
[![Gem Version](https://badge.fury.io/rb/jenkins_tracker.png)](http://badge.fury.io/rb/jenkins_tracker)

`jenkins_tracker` is a command line utility packaged as a [RubyGem](https://rubygems.org/gems/jenkins_tracker) that
integrates [Jenkins CI](http://jenkins-ci.org/) build information with [Pivotal Tracker](https://www.pivotaltracker.com) stories within a project.
The underlying library is also used in the native [Pivotal Tracker Jenkins Plugin](https://github.com/prashantrajan/pivotal-tracker-jenkins-plugin).

This is an example of a successful build integration:

![Jenkins Post Build Action Screenshot](https://raw.github.com/prashantrajan/static_assets/master/jenkins_tracker/images/tracker_comment_2.jpg)


## Requirements

### Jenkins

* Git as your SCM via the [Jenkins Git Plugin](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin).

* The build changelog file is available at `$JENKINS_HOME/jobs/$JOB_NAME/builds/$BUILD_NUMBER/changelog.xml`.
  The changelog contents look like this [example](https://github.com/prashantrajan/jenkins_tracker/blob/master/spec/fixtures/git_changelog.txt).

* `Ruby` is available in the environment.

* Environment variables exists for `$JENKINS_HOME`, `$JOB_NAME`, `$BUILD_NUMBER` & `$BUILD_URL`.

### Pivotal Tracker

* You have created an [API Token](https://www.pivotaltracker.com/profile).

* Project has [API access enabled](https://www.pivotaltracker.com/help/api) (it's enabled by default).


## Installation

Add this line to your application's Gemfile:

    gem 'jenkins_tracker'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jenkins_tracker


## Usage

### As a Post-build Action script

Requires the [Post build task plugin](http://wiki.hudson-ci.org/display/HUDSON/Post+build+task):

```
# Assuming environment variables for $JENKINS_HOME, $JOB_NAME, $BUILD_NUMBER & $BUILD_URL exists

$ bundle exec jenkins_tracker integrate --tracker-token ABC123456 --tracker-project-id 123456
# => Successfully integrated Jenkins Job $JOB_NAME with Pivotal Tracker Project #123456
```
    
![Jenkins Post Build Action Screenshot](https://raw.github.com/prashantrajan/static_assets/master/jenkins_tracker/images/jenkins_post_build_action_2.jpg)


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
