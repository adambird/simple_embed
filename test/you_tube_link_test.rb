require 'helper'

module SimpleEmbed
  class YouTubeLinkTest < Test::Unit::TestCase
  
    should "http://www.youtube.com/watch?v=eOfaBZ1LohA" do
      url = "http://www.youtube.com/watch?v=eOfaBZ1LohA"
      assert YouTubeLink.match_expression.match(url)
      assert_equal "eOfaBZ1LohA", YouTubeLink.new(url).video_id    
    end
  
    should "http://www.youtube.com/watch?v=HozjJchc-Ng&feature=channel_video_title" do
      url = "http://www.youtube.com/watch?v=HozjJchc-Ng&feature=channel_video_title"
      assert YouTubeLink.match_expression.match(url)
      assert_equal "HozjJchc-Ng", YouTubeLink.new(url).video_id    
    end
  
    should "http://www.youtube.com/watch?v=9T4gVw29xW4&feature=channel_video_title" do
      url = "http://www.youtube.com/watch?v=9T4gVw29xW4&feature=channel_video_title"
      assert YouTubeLink.match_expression.match(url)
      assert_equal "9T4gVw29xW4", YouTubeLink.new(url).video_id    
    end

    should "http://www.youtube.com/watch?v=W_e4AcM65bE" do
      url = "http://www.youtube.com/watch?v=W_e4AcM65bE"
      assert YouTubeLink.match_expression.match(url)
      assert_equal "W_e4AcM65bE", YouTubeLink.new(url).video_id    
    end
  
    should "http://youtu.be/HozjJchc-Ng" do
      url = "http://youtu.be/HozjJchc-Ng"
      assert YouTubeLink.match_expression.match(url)
      assert_equal "HozjJchc-Ng", YouTubeLink.new(url).video_id    
    end
  end
end