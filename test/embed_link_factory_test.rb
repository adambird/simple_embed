require 'helper'

module SimpleEmbed
  class EmbedLinkFactoryTest < Test::Unit::TestCase

    should "return a YouTubeLink when a youtube url is passed" do
      url = "http://www.youtube.com/watch?v=W_e4AcM65bE"
      link = EmbedLinkFactory.get_embed_link(url)
      assert link.instance_of?(YouTubeLink)
    end
    
    should "return a GarminConnectLink when a garmin connect url is passed" do
      url = 'http://connect.garmin.com/activity/87326928'
      link = EmbedLinkFactory.get_embed_link(url)
      assert link.instance_of?(GarminConnectLink)
    end
    
    should "return a DefaultLink when an unrecognised url is passed" do
      url = 'http://bilge.com/2183763/jshfgsjfd'
      link = EmbedLinkFactory.get_embed_link(url)
      assert link.instance_of?(DefaultLink)
    end

    should "return a MapMyRideLink when a MapMyRide url is passed" do
      url = 'http://www.mapmyride.com/routes/view/11966280'
      link = EmbedLinkFactory.get_embed_link(url)
      assert link.instance_of?(MapMyRideLink)
    end
    
  end
end