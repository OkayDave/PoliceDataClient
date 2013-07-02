require_relative '../../test_helper'


describe PoliceDataClient::Neighbourhood do
 
  subject  { PoliceDataClient::Neighbourhood }

  it "must fetch an array of Neighbourhoods for a valid force id" do
    force_id = "avon-and-somerset"
    array = subject.list(force_id)
    array.must_be_instance_of(Array)
  end

  it "must return an array consisting of Neighbourhood objects" do 
    force_id = "avon-and-somerset"
    array = subject.list(force_id)
    array.first.must_be_instance_of(PoliceDataClient::Neighbourhood)
  end

  it "must return full information of a Neighbourhood given a valid id" do 
    force_id = "avon-and-somerset"
    neighbourhood_id = "ER130"
    neighbourhood = subject.specific(force_id, neighbourhood_id)
    neighbourhood.welcome_message.wont_be_nil
  end

end