module SimpleEmbed
  class DefaultLink < EmbedLink 
    def embed_code
      "<a href=\"#{@url}\"/>"
    end
  end
end
