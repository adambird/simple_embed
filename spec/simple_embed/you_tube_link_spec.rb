require 'spec_helper'

describe YouTubeLink do
  before(:each) do
    @urls = [
      "http://www.youtube.com/watch?v=eOfaBZ1LohA",
      "http://www.youtube.com/watch?v=HozjJchc-Ng&feature=channel_video_title",
      "http://www.youtube.com/watch?v=9T4gVw29xW4&feature=channel_video_title",
      "http://www.youtube.com/watch?v=W_e4AcM65bE",
      "http://youtu.be/HozjJchc-Ng"
      ]
  end
    
  describe ".match_expression" do
    it "matches all valid urls" do
      @urls.each { |url| YouTubeLink.match_expression.match(url).should be_true }
    end
  end
  
  describe "#video_id" do
    before(:each) do
      @video_ids = [
        "eOfaBZ1LohA", "HozjJchc-Ng", "9T4gVw29xW4", "W_e4AcM65bE", "HozjJchc-Ng"
        ]
    end
    it "matches each video id" do
      (0..@urls.count).each { |i| YouTubeLink.new(@urls[i]).video_id.should eq(@video_ids[i]) }
    end
  end

end
