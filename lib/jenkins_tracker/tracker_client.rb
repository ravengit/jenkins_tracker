module JenkinsTracker
  class TrackerClient

    attr_writer :use_ssl
    attr_reader :token

    def initialize(options = {})
      @token = options[:token]
    end

    def connection(options = {})
      @connection ||= RestClient::Resource.new(api_url, :headers => { 'X-TrackerToken' => token, 'Content-Type' => 'application/xml' })
    end

    def add_note_to_story(project_id, story_id, note)
      begin
        connection["projects/#{project_id}/stories/#{story_id}/notes"].post("<note><text>#{note}</text></note>")
      rescue => e
        # if the post fails for whatever reason (e.g. invalid story id etc), just ignore it
        puts ["An error occurred while trying add note to Story ##{story_id} in Project ##{project_id} ", e.message, e.backtrace] * "\n"
      end
    end


    private

    def tracker_host
      'www.pivotaltracker.com'
    end

    def api_path
      '/services/v3'
    end

    def api_url
      "#{protocol}://#{tracker_host}#{api_path}"
    end

    def use_ssl
      @use_ssl || false
    end

    def protocol
      use_ssl ? 'https' : 'http'
    end

  end
end
