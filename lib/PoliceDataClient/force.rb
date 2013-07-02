module PoliceDataClient
  class Force
    include APISmith::Client
    base_uri "http://data.police.uk/api/"
    attr_accessor :id, :name, :description, :url, :engagement_methods, :telephone
    @@forces = []

    def initialize id, name
      @id = id
      @name = name
    end

    def self.list
      # returns array of Forces 
      return @@forces unless @@forces.empty?
      @@forces = []
      self.fetch_list.each do |f|
        @@forces << self.new(f["id"], f["name"])
      end
      @@forces
    end

    def self.fetch_list
      get("/forces").parsed_response
    end


    def self.specific id 
      info_hash = get("/forces/#{id}").parsed_response
      force = Force.new(info_hash["id"], info_hash["name"])
      force.description = info_hash["description"]
      force.url = info_hash["url"]
      force.engagement_methods = info_hash["engagement_methods"]
      force.telephone = info_hash["telephone"]
      return force.id.nil? ? nil : force
    rescue 
      return nil
    end

    def get_full_information
      if self.description.nil?
        info_hash = get("/forces/#{id}").parsed_response
        @description = info_hash["description"]
        @url = info_hash["url"]
        @engagement_methods = info_hash["engagement_methods"]
        @telephone = info_hash["telephone"]
      end
      return self
      
    end
  end

end