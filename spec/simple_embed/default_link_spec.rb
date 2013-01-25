require 'spec_helper'

describe DefaultLink do
  describe "#embed_code" do
    before(:each) do
      @options = {}
      @url = "http://connect.garmin.com/activity/87326928"
    end
    
    subject { DefaultLink.new(@url).embed_code(@options) }
    
    it "returns the truncated link" do
      subject.should eq("<a href=\"#{@url}\">connect.garmin....tivity/87326928</a>")
    end
    context "when no protocol prefix" do
      before(:each) do
        @url = "www.gpsies.com/map.do?fileId=ygmrwszjcoxhgtht"
      end
      it "adds the protocol prefix" do
        subject.should eq("<a href=\"http://#{@url}\">www.gpsies.com/...gmrwszjcoxhgtht</a>")
      end
    end
    context "when no_follow set" do
      before(:each) do
        @options = { no_follow: true }
      end
      it "returns the link with the rel nofollow attribute" do
        subject.should eq("<a href=\"#{@url}\" rel=\"nofollow\">connect.garmin....tivity/87326928</a>")
      end
    end
  end
end
