module SimpleEmbed
  class FlickrLink < EmbedLink
    def FlickrLink.match_expression
      /flickr.com\/photos\/[\w]*\/sets\//
    end
  
    def embed_code
      "<iframe align=\"center\" src=\"http://www.flickr.com/slideShow/index.gne?set_id=#{set_id}\" frameBorder=\"0\" width=\"450\" height=\"330\" scrolling=\"no\"></iframe>"
    end
  
    def user_id
      /flickr.com\/photos\/(?:([\w]*))/.match(@url)[1]          
    end
  
    def set_id
      /flickr.com\/photos\/[\w]*\/sets\/(?:([\d]*))/.match(@url)[1]      
    end
  end
end