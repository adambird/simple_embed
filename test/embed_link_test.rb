require 'helper'

module SimpleEmbed
  class EmbedLinkTest < Test::Unit::TestCase
  
    should "calculate height from overridden aspect ratio" do
      link = DummyLink.new("http://my.website.com/some/link/to/something.html")
      link.aspect_ratio = 1.62
      
      assert_equal 287, link.embed_height
    end
  
  end
end