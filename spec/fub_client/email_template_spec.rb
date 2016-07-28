require 'spec_helper'

describe FubClient::EmailTemplate, :vcr do
  describe '.all' do
    it 'brings the correct event' do
      objects = described_class.all
      expect(objects.length).to be > 0
      expect(objects.first).to be_kind_of(described_class)
    end
  end
end
