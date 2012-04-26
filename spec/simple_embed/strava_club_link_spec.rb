require 'spec_helper'

describe StravaClubLink do
  describe "#club_id" do
    before(:each) do
      @link = StravaClubLink.new("http://app.strava.com/clubs/beeston-cc")
    end
    
    subject { @link.club_id }
    
    it "extracts the club id from the link" do
      subject.should eq("beeston-cc")
    end
  end
end
