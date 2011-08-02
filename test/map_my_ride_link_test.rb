require 'helper'

module SimpleEmbed
  class MapMyRideLinkTest < Test::Unit::TestCase
    
    should "extract mapmyride route id" do
      target = MapMyRideLink.new("http://www.mapmyride.com/routes/view/11966280")
      assert_equal "11966280", target.route_id
    end
  
    should "resolve mapmyride route key" do
      doc = Nokogiri::HTML(open(File.dirname(__FILE__) + '/support/map_my_ride_test.html'))
    
      target = MapMyRideLink.new("http://www.mapmyride.com/routes/view/11966280")
    
      assert_equal "437125773269621521", target.route_key(doc)
    end
  
    should "route link matching" do
      assert MapMyRideLink.match_expression.match("http://www.mapmyride.com/routes/view/11966280")
    end
  
    should "test profile link not matching" do
      assert !MapMyRideLink.match_expression.match("http://www.mapmyride.com/profile/604670/")
    end
  
  end
end