require 'spec_helper'
require 'nokogiri'

describe MapMyRideLink do
  describe "#route_id" do
    before(:each) do
      @link = MapMyRideLink.new("http://www.mapmyride.com/routes/view/11966280")
    end
    
    subject { @link.route_id }
    
    it "extracts the activity id from the link" do
      subject.should eq("11966280")
    end
  end
  
  describe "#route_key" do
    before(:each) do
      @mock_doc = Nokogiri::HTML(open_file('map_my_ride_test.html'))
      @target = MapMyRideLink.new("http://www.mapmyride.com/routes/view/11966280")
    end
    
    subject { @target.route_key(@mock_doc) }
    
    it "returns the key from the doc" do
      subject.should eq("437125773269621521")
    end
  end
  
  describe ".match_expression" do
    it "matches a route link eg: http://www.mapmyride.com/routes/view/11966280" do
      MapMyRideLink.match_expression.match("http://www.mapmyride.com/routes/view/11966280").should be_true
    end
    it "does not match a profile link eg: http://www.mapmyride.com/profile/604670/" do
      MapMyRideLink.match_expression.match("http://www.mapmyride.com/profile/604670/").should be_false
    end
  end

end
