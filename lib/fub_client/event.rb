module FubClient
  class Event < Resource
    attributes :created, :updated, :person_id, :message, :description,
               :note_id, :source, :type, :property
               
    belongs_to :person
  end
end
