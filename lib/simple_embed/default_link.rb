module SimpleEmbed
  class DefaultLink < EmbedLink 
    URL_LENGTH = 30
    
    remove_const(:AUTO_LINK_RE) if defined?(AUTO_LINK_RE)
    AUTO_LINK_RE = %r{
        ( https?:// | www\. )
        [^\s<]+
      }x

    def embed_code
      @url.to_str.gsub(AUTO_LINK_RE) do
        href = $&
        href = 'http://' + href unless href =~ %r{^[a-z]+://}i
        "<a href=\"#{href}\">#{truncate_url(@url)}</a>"
      end
    end
    
    def truncate_url(url)
      url = url.gsub(/http(s)?:\/\//x, '')
      url.length > URL_LENGTH ? "#{url[0..(URL_LENGTH/2 - 1)]}...#{url[url.length - (URL_LENGTH/2), url.length - 1]}" : url
    end
  end
end
