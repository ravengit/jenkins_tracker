module JenkinsTracker
  class ChangelogItem

    attr_accessor :story_id, :commit_message

    def initialize(options = {})
      @story_id = options[:story_id]
      @commit_message = options[:commit_message]
    end

    def ==(other)
      self.story_id == other.story_id && self.commit_message == other.commit_message
    end

    def eql?(other)
      (self.class == other.class) && self == other
    end

    def hash
      [story_id, commit_message].hash
    end

  end
end
