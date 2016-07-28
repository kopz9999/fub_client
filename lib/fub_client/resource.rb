module FubClient
  class Resource
    include Her::Model
    use_api FubClient::Client.instance.her_api
    
    scope :by_page, -> (page, per_page) { 
      where(offset: (page - 1)*per_page, limit: per_page) 
    }
    
    def self.total
      by_page(1, 1).metadata[:total]
    end
  end
end
