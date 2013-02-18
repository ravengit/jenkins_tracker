require 'spec_helper'

describe JenkinsTracker::ChangelogItem do

  describe '#story_id' do
    it 'accessor methods' do
      expect(described_class.new).to respond_to('story_id')
      expect(described_class.new).to respond_to('story_id=')
    end
  end

  describe '#commit_message' do
    it 'accessor methods' do
      expect(described_class.new).to respond_to('commit_message')
      expect(described_class.new).to respond_to('commit_message=')
    end
  end

  describe '==(other)' do
    it 'is equal to other when its story_id & commit_message are equal' do
      item1 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item2 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item3 = item1

      expect(item1).to eq(item2)
      expect(item3).to eq(item2)
    end

    it 'is not equal to other when its story_id are not equal' do
      item1 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item2 = described_class.new(:story_id => 2, :commit_message => '123abc')

      expect(item1).to_not eq(item2)
    end

    it 'is not equal to other when its commit_message are not equal' do
      item1 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item2 = described_class.new(:story_id => 1, :commit_message => 'xyz')

      expect(item1).to_not eq(item2)
    end
  end

  describe 'eql?(other)' do
    let(:fake_changelog_class) { Struct.new(:story_id, :commit_message) }

    it 'is equal to other when its class and attributes are equal' do
      item1 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item2 = fake_changelog_class.new(1, '123abc')
      item3 = item1

      expect(item1).to_not eql(item2)
      expect(item3).to eql(item1)
    end
  end

  describe 'an array of ChangelogItems' do
    it 'correctly removes duplicates when uniq is called' do
      item1 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item2 = described_class.new(:story_id => 1, :commit_message => '123abc')
      item3 = described_class.new(:story_id => 1, :commit_message => 'xyz')
      item4 = described_class.new(:story_id => 2, :commit_message => '123abc')

      expect([item1, item2].uniq.size).to eq(1)
      expect([item1, item3].uniq.size).to eq(2)
      expect([item1, item4].uniq.size).to eq(2)
      expect([item1, item3, item4].uniq.size).to eq(3)
    end
  end

end
