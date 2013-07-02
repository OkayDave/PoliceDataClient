module PoliceDataClient
  class Neighbourhood
    include APISmith::Client
    base_uri "http://data.police.uk/api/"
    attr_accessor :neighbourhood_id, :name, :url_force, :url_boundary, :contact_details, :welcome_message, :links,
                  :centre, :locations, :population, :description, :force_id
    @@neighbourhoods = {} # @@neighbourhoods[force_id] => [Neighbourhood, Neighbourhood ...]

    def initialize neighbourhood_id, force_id, name
      @neighbourhood_id = neighbourhood_id
      @force_id = force_id
      @name = name
    end

    def self.list force_id
      # returns array of neighbourhoods for a given Force 
      return @@neighbourhoods[force_id] unless @@neighbourhoods[force_id].nil? || @@neighbourhoods[force_id].empty? 
      @@neighbourhoods[force_id] = []
      self.fetch_list(force_id).each do |f|
        @@neighbourhoods[force_id] << self.new(f["id"], force_id, f["name"])
      end
      @@neighbourhoods[force_id]
    end

    def self.fetch_list force_id
      get("/#{force_id}/neighbourhoods").parsed_response
    end


    def self.specific force_id, neighbourhood_id 
      neighbourhood = Neighbourhood.new(neighbourhood_id, force_id, "")
      neighbourhood.get_full_information
      
      return neighbourhood.neighbourhood_id.nil? ? nil : neighbourhood
    rescue 
      return nil
    end

    def get_full_information
      if self.description.nil?
        info_hash = get("/#{force_id}/#{neighbourhood_id}").parsed_response
        @name            = info_hash["name"]                            || ""
        @url_force       = info_hash["url_force"]                       || ""
        @url_boundary    = info_hash["url_boundary"]                    || ""
        @contact_details = info_hash["contact_details"]                 || {}
        @welcome_message = info_hash["welcome_message"]                 || ""
        @links           = info_hash["links"]                           || []
        @centre          = info_hash["centre"]                          || {}
        @locations       = Location.parse_array(info_hash["locations"]) || []
        @population      = info_hash["population"].to_i                 || 0
        @description     = info_hash["description"]                     || ""
      end
      return self
      
    end

    def id
      return @neighbourhood_id
    end
  end

end