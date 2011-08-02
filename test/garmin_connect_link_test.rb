require 'helper'

module SimpleEmbed
  class GarminConnectLinkTest < Test::Unit::TestCase
  
    should "extract activity id" do
      assert_equal "87326928", GarminConnectLink.new("http://connect.garmin.com/activity/87326928").activity_id
    end
  
  end
end