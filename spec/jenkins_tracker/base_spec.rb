require 'spec_helper'

describe JenkinsTracker::Base do

  describe '#initialize' do
    it 'does basic set up' do
      obj = described_class.new(
        :jenkins_changelog_filename => fixture_file_path('git_changelog.txt'),
        :tracker_token => 'xxx',
        :job_name => 'foo_job',
        :build_url => 'http://jenkins.bitium/com/foo_job/3'
      )
      expect(obj.changelog).to eq( File.read(fixture_file_path('git_changelog.txt')) )
      expect(obj.tracker_client.token).to eq('xxx')
      expect(obj.job_name).to eq('foo_job')
      expect(obj.build_url).to eq('http://jenkins.bitium/com/foo_job/3')
    end
  end

end
