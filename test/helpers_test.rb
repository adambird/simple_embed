require 'helper'

module SimpleEmbed
  class HelpersTest < Test::Unit::TestCase
    
    should "auto embed properly" do
      source = "this is a http://www.youtube.com/watch?v=eOfaBZ1LohA you tube link"
      expected = "this is a <iframe width=\"465\" height=\"287\" src=\"http://www.youtube.com/embed/eOfaBZ1LohA\" frameborder=\"0\" allowfullscreen></iframe> you tube link"
      actual = Helpers.auto_embed(source)
      
      assert_equal expected, actual
    end
    
    should "indicate that this contains a link" do
      assert Helpers.contains_link?("this is a http://www.youtube.com/watch?v=eOfaBZ1LohA you tube link")
    end
    
    should "not indicate that this contains a link" do
      assert !Helpers.contains_link?("some textrt lsjdhf psdfih sdfl spsdfjhdsfkjdf kuhf f")
    end
    
  end
end