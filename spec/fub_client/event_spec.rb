require 'spec_helper'

describe FubClient::Event, :vcr do
  describe '.find' do
    it 'brings the correct event' do
      evt = described_class.find 11195
      expect(evt).not_to be_nil
      expect(evt).to have_attributes(person_id: 24477, message: '', 
        description: "Best Time to Call: Today; Email: "+
        "DanLopez@LegendsRE.com; Phone Number: 407-705-3915", note_id: nil,
        source: 'Curaytor Appointment', type: 'Registration')
    end
  end
  
  describe '.all' do
    it 'brings the correct event' do
      events = described_class.all
      expect(events.length).to be > 0
      expect(events.first).to be_kind_of(described_class)
    end
  end
  
  describe '.by_page' do
    it 'brings the correct person' do
      events = described_class.by_page(3, 25)
      expect(events.metadata[:offset]).to eq 50
      expect(events.metadata[:limit]).to eq 25
    end
  end
  
  describe '.total' do
    it 'gets the number of records' do
      expect(described_class.total).to eq 11105
    end
  end

  describe '#person' do
    it 'brings the correct person' do
      evt = described_class.find 11195
      expect(evt).not_to be_nil
      expect(evt.person).not_to be_nil
      expect(evt.person).to be_kind_of(FubClient::Person)
      expect(evt.person).to have_attributes(name: 'Dan Lopez', 
        source_url: "http://curaytor.com/schedule")
    end
  end
end
