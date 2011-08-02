module SimpleEmbed
  class VimeoLink < EmbedLink
    def VimeoLink.match_expression
      /vimeo.com/
    end
  
    def embed_code
      "<iframe src=\"http://player.vimeo.com/video/#{video_id}?portrait=0\" width=\"450\" height=\"286\" frameborder=\"0\"></iframe>"
    end

    def video_id
      /vimeo.com\/(?:([\d]*))/.match(@url)[1]
    end
  end
end