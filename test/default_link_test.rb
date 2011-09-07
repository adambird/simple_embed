require 'helper'

module SimpleEmbed
  class DefaultLinkTest < Test::Unit::TestCase
  
    should "return truncated link" do
      url = "http://connect.garmin.com/activity/87326928"
      assert_equal "<a href=\"#{url}\">connect.garmin....tivity/87326928</a>", DefaultLink.new(url).embed_code
    end
    
    should "return link with protocol prefix" do
      url = "www.gpsies.com/map.do?fileId=ygmrwszjcoxhgtht"
      assert_equal "<a href=\"http://#{url}\">www.gpsies.com/...gmrwszjcoxhgtht</a>", DefaultLink.new(url).embed_code
    end
  end
end