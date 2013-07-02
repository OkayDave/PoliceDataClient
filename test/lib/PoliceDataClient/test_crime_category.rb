require_relative '../../test_helper'


describe PoliceDataClient::CrimeCategory do
 
  subject  { PoliceDataClient::CrimeCategory }

  it "must return a list of all crime categories" do 
    subject.list.must_be_instance_of Array 
    subject.list.first.must_be_instance_of subject
  end

  it "must have url and name" do 
    subject.list.first.url.wont_be_nil 
    subject.list.first.name.wont_be_nil
  end

end

