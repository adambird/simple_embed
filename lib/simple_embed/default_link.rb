module SimpleEmbed
  class DefaultLink < EmbedLink 
    URL_LENGTH = 30
    
    def embed_code
      "<a href=\"#{@url}\">#{truncate_url(@url)}</a>"
    end
    
    def truncate_url(url)
      url = url.gsub(/http(s)?:\/\//x, '')
      url.length > URL_LENGTH ? "#{url[0..(URL_LENGTH/2 - 1)]}...#{url[url.length - (URL_LENGTH/2), url.length - 1]}" : url
    end
  end
end
