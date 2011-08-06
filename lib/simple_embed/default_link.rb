module SimpleEmbed
  class DefaultLink < EmbedLink 
    def embed_code
      "<a href=\"#{@url}\">#{@url}</a>"
    end
  end
end
