require_relative '../../test_helper'


describe PoliceDataClient::Force do
 
  subject  { PoliceDataClient::Force }
  #force { list.first }

  it "must return array" do
    subject.list.must_be_instance_of Array
  end

  it "must be an array containing Force objects" do 
    subject.list.first.must_be_instance_of PoliceDataClient::Force
  end
 
  it "must have an id" do 
    subject.list.first.id.wont_be_nil
  end

  it "must have a name" do 
    subject.list.first.name.wont_be_nil
  end

  it "must return full information for a valid force" do 
    subject.specific(subject.list.sample.id).description.wont_be_nil
  end

  it "must return nil for an invalid force" do 
    subject.specific("made up force").must_be_nil
  end


end