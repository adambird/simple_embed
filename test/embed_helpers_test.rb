require 'helper'

module SimpleEmbed
  class EmbedHelpersTest < Test::Unit::TestCase
    
    should "auto embed properly" do
      source = "this is a http://www.youtube.com/watch?v=eOfaBZ1LohA you tube link"
      expected = "this is a <iframe width=\"465\" height=\"287\" src=\"http://www.youtube.com/embed/eOfaBZ1LohA\" frameborder=\"0\" allowfullscreen></iframe> you tube link"
      actual = EmbedHelpers.auto_embed(source)
      
      assert_equal expected, actual
    end
  end
end