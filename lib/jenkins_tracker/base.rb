module JenkinsTracker
  class Base
    include Util

    attr_reader :changelog, :tracker_client, :job_name, :build_url

    def initialize(options = {})
      @changelog = File.read(options[:jenkins_changelog_filename])
      @tracker_client = TrackerClient.new(:token => options[:tracker_token])
      @job_name = options[:job_name]
      @build_url = options[:build_url]
    end

    def integrate_job_with_tracker(project_id)
      parse_changelog(changelog).each do |change|
        note = "*#{change.commit_message}* integrated in *#{job_name}* (#{build_url})"
        tracker_client.add_note_to_story(project_id, change.story_id, note)
      end
    end

  end
end
