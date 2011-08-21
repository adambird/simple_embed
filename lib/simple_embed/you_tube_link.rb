module SimpleEmbed
  class YouTubeLink < EmbedLink
    def YouTubeLink.match_expression
      /youtube.com|youtu.be/i
    end
  
    def embed_code
      "<iframe width=\"#{embed_width}\" height=\"#{embed_height}\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
    end
    
    def aspect_ratio
      1.62
    end
    
    def video_id
      if @url =~ /youtube.com/
        /v=(?:([\w-]*))/.match(@url)[1]
      else 
        if @url =~ /youtu.be/
          /youtu.be\/(?:([\w-]*))/.match(@url)[1]
        end
      end
    end
  end
end