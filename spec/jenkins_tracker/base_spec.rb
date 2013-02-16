require 'spec_helper'

describe JenkinsTracker::Base do

  describe '#initialize' do
    it 'does basic set up' do
      obj = described_class.new(
        :changelog_file => fixture_file_path('git_changelog.txt'),
        :tracker_token => 'xxx',
        :job_name => 'foo_job',
        :build_url => 'http://jenkins.bitium/com/foo_job/3'
      )
      expect(obj.changelog).to eq( File.read(fixture_file_path('git_changelog.txt')) )
      expect(obj.tracker_client.token).to eq('xxx')
      expect(obj.job_name).to eq('foo_job')
      expect(obj.build_url).to eq('http://jenkins.bitium/com/foo_job/3')
    end

    it 'uses an SSL connection for the Tracker Client' do
      obj = described_class.new(
        :changelog_file => fixture_file_path('git_changelog.txt'),
        :tracker_token => 'xxx'
      )
      expect(obj.tracker_client.connection.to_s).to start_with('https://')
    end

    context 'when changelog file does not exist' do
      it 'raises a FileNotFoundError' do
        changelog_file = '/a/non-existent/file/path'

        expect {
          described_class.new(:changelog_file => changelog_file)
        }.to raise_error(JenkinsTracker::FileNotFoundError, "Changelog file not found at: #{changelog_file}")
      end
    end
  end

end
