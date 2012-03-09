require 'spec_helper'

describe DefaultLink do
  describe "#embed_code" do
    before(:each) do
      @url = "http://connect.garmin.com/activity/87326928"
    end
    
    subject { DefaultLink.new(@url).embed_code }
    
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
  end
end
