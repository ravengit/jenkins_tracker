require 'spec_helper'


class UtilModuleTester
  include JenkinsTracker::Util
end


describe JenkinsTracker::Util do
  #let!(:class_instance) { UtilModuleTester.new }

  #describe '#parse_json' do
  #  let(:json_str) { load_fixture_as_str('job.json') }
  #
  #  it 'returns a Ruby data structure representation of the JSON string' do
  #    results = class_instance.parse_json(json_str)
  #    expect(results['changeSet']['items'].size).to eq(2)
  #  end
  #
  #end

end