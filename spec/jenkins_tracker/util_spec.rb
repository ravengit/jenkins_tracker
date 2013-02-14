require 'spec_helper'


class UtilModuleTester
  include JenkinsTracker::Util
end


describe JenkinsTracker::Util do
  let!(:class_instance) { UtilModuleTester.new }

  #describe '#parse_json' do
  #  let(:json_str) { load_fixture_as_str('job.json') }
  #
  #  it 'returns a Ruby data structure representation of the JSON string' do
  #    results = class_instance.parse_json(json_str)
  #    expect(results['changeSet']['items'].size).to eq(2)
  #  end
  #
  #end

  describe '#parse_changelog' do
    let(:git_changelog) { load_fixture_as_str('git_changelog.txt') }

    it 'returns an array of struct objects' do
      results = class_instance.parse_changelog(git_changelog)
      expect(results.first.story_id).to eq(123)
      expect(results.first.commit_message).to eq('[#123 #456] added more test')

      expect(results.last.story_id).to eq(789)
      expect(results.last.commit_message).to eq('[Fixes #456 #789] added test 1 to readme')
    end
  end

end