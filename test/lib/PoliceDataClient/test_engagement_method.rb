require_relative '../../test_helper'


describe PoliceDataClient::EngagementMethod do
 
  subject  { PoliceDataClient::EngagementMethod }

  it "must parse a list of valid engagement methods" do
    list = [{title: "test 1", description: "test 1", url: "test 1"}, {title: "test 2", description: "test 2", url: "test 2"}]
    array = subject.parse_array(list)
    array.must_be_instance_of(Array)
  end

  it "must expose correct variables" do 
    em = subject.new("Title", "Description", "Url")
    em.title.must_equal "Title"
    em.description.must_equal "Description"
    em.url.must_equal "Url"
  end

end