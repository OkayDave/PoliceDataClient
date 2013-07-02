module PoliceDataClient
  class CrimeCategory
    include APISmith::Client
    base_uri "http://data.police.uk/api/"
    attr_accessor :url, :name
    @@crime_categories = []


    def initialize url, name
      @url = url
      @name = name
    end

    def self.list 
      if @@crime_categories.empty?
        date = Date.today.strftime("%Y-%m")

        data = get("/crime-categories?q=#{date}").parsed_response
        @@crime_categories = data.map{|cc| CrimeCategory.new(cc["url"], cc["name"]) }
      end
      @@crime_categories
    end
  end

end