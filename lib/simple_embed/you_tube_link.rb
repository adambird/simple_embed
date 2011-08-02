module SimpleEmbed
  class YouTubeLink < EmbedLink
    def YouTubeLink.match_expression
      /youtube.com|youtu.be/
    end
  
    def embed_code
      "<iframe width=\"450\" height=\"286\" src=\"http://www.youtube.com/embed/#{video_id}\" frameborder=\"0\" allowfullscreen></iframe>"
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