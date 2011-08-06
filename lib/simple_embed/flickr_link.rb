module SimpleEmbed
  class FlickrLink < EmbedLink
    def FlickrLink.match_expression
      /flickr.com\/photos\/[\w]*\/sets\//
    end
  
    def embed_code
      "<iframe align=\"center\" src=\"http://www.flickr.com/slideShow/index.gne?set_id=#{set_id}\" frameBorder=\"0\" width=\"#{embed_width}\" height=\"#{embed_height}\" scrolling=\"no\"></iframe>"
    end
  
    def aspect_ratio
      1.36
    end
    
    def user_id
      /flickr.com\/photos\/(?:([\w]*))/.match(@url)[1]          
    end
  
    def set_id
      /flickr.com\/photos\/[\w]*\/sets\/(?:([\d]*))/.match(@url)[1]      
    end
  end
end