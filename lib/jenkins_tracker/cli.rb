require 'thor'

module JenkinsTracker
  class Cli < Thor

    desc 'integrate', 'Integrate Jenkins build with Pivotal Tracker project stories'
    method_option 'tracker-token', :required => true, :desc => 'Pivotal Tracker API Token'
    method_option 'tracker-project-id', :required => true, :type => :numeric, :desc => 'Pivotal Tracker Project ID'
    method_option 'job-name', :default => ENV['JOB_NAME'], :desc => 'Jenkins job name'
    method_option 'build-url', :default => ENV['BUILD_URL'], :desc => 'Jenkins build URL'
    method_option 'changelog-file', :desc => 'Absolute path to changelog file.', :default => "#{ENV['JENKINS_HOME']}/jobs/#{ENV['JOB_NAME']}/builds/#{ENV['BUILD_NUMBER']}/changelog.xml"
    def integrate
      job_name = options['job-name']
      tracker_project_id = options['tracker-project-id']

      begin
        JenkinsTracker::Base.new(
          :changelog_file => options['changelog-file'],
          :tracker_token => options['tracker-token'],
          :job_name      => job_name,
          :build_url     => options['build-url']
        ).integrate_job_with_tracker(tracker_project_id)

        say "Successfully integrated Jenkins Job (#{job_name}) with Pivotal Tracker Project (#{tracker_project_id})", :green
      rescue FileNotFoundError => e
        say e.message, :red
      end
    end

  end
end
