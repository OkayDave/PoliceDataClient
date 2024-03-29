require "api_smith"
require_relative "./PoliceDataClient/version"
require_relative "./PoliceDataClient/force"
require_relative "./PoliceDataClient/engagement_method"
require_relative "./PoliceDataClient/neighbourhood"
require_relative "./PoliceDataClient/location"
require_relative "./PoliceDataClient/crime_category"

module PoliceDataClient
  include APISmith::Client
  base_uri "http://data.police.uk/"
  endpoint "api"
  # Your code goes here...

  def self.hello
    "hello"
  end
end
