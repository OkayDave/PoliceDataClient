module PoliceDataClient
  class Location
    attr_accessor :name, :latitude, :longitude, :address, :postcode, :type, :description

    def initialize params
      @name         = params["name"]          || ""
      @latitude     = params["latitude"]      || ""
      @longitude    = params["longitude"]     || ""
      @address      = params["address"]       || ""
      @postcode     = params["postcode"]      || ""
      @type         = params["type"]          || ""
      @description  = params["description"]   || ""

    end

    def self.parse_array array 
      array.map {|l| Location.new(l)}
    end
  end

end