require 'spec_helper'

describe GarminConnectLink do
  describe "#activity_id" do
    before(:each) do
      @link = GarminConnectLink.new("http://connect.garmin.com/activity/87326928")
    end
    
    subject { @link.activity_id }
    
    it "extracts the activity id from the link" do
      subject.should eq("87326928")
    end
  end
end
