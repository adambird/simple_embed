module SimpleEmbed
  class VimeoLink < EmbedLink
    def VimeoLink.match_expression
      /vimeo.com/i
    end
  
    def embed_code(options={})
      "<iframe src=\"http://player.vimeo.com/video/#{video_id}?portrait=0\" width=\"#{embed_width}\" height=\"#{embed_height}\" frameborder=\"0\"></iframe>"
    end

    def aspect_ratio
      1.62
    end
    
    def video_id
      /vimeo.com\/(?:([\d]*))/.match(@url)[1]
    end
  end
end