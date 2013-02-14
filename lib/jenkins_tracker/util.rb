module JenkinsTracker
  module Util

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
    end

    #def parse_json(str, options = {})
    #  JSON.parse(str, options)
    #end

    def parse_changelog(str)
      results = []

      str.scan(/(\[[#a-zA-Z0-9\s]+\])(.*)/) do |ids, msg|
        parse_tracker_story_ids(ids).each do |id|
          results << OpenStruct.new(:story_id => id, :commit_message => "#{ids}#{msg}".strip)
        end
      end

      results
    end

    def parse_tracker_story_ids(str)
      str.strip.gsub(/[\[#\]]/, '').split(' ').map(&:to_i).reject { |i| i == 0 }
    end

  end
end
