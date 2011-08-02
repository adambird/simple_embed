require 'helper'

module SimpleEmbed
  class VimeoLinkTest < Test::Unit::TestCase

    should "extract video id" do
      assert_equal "5951947", VimeoLink.new("http://vimeo.com/5951947").video_id
    end
  
  end
end