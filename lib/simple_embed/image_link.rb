module SimpleEmbed
  class ImageLink < EmbedLink 
    def ImageLink.match_expression
      /\.(jpg|jpeg|png|gif)(\?.*)*$/i
    end
    
    # relying on brouser to retain aspect ratio of image as don't know the size
    def embed_code
      "<img src=\"#{@url}\" width=\"#{embed_width}\"/>"
    end
  end
end