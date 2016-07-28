require 'spec_helper'

describe FubClient::EmEvent, :vcr do
  describe '.all' do
    it 'pulls down resource' do
      objects = described_class.all
      expect(objects.length).to be > 0
      expect(objects.first).to be_kind_of(described_class)
    end
  end
end
