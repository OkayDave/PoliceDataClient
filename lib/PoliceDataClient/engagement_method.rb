module PoliceDataClient
  class EngagementMethod
    attr_accessor :title, :description, :url
    
    def initialize title, description, url
      @title = title
      @description = description
      @url = url
    end

    def self.parse_array array 
      array.map{|em| EngagementMethod.new(em["title"], em["description"], em["url"])}
    end

  end

end