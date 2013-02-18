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

  end
end
