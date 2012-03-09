module SimpleEmbed
  require 'simple_embed/embed_link'
  require 'simple_embed/embed_link_factory'
  require 'simple_embed/flickr_link'
  require 'simple_embed/garmin_connect_link'
  require 'simple_embed/map_my_ride_link'
  require 'simple_embed/vimeo_link'
  require 'simple_embed/you_tube_link'
  require 'simple_embed/default_link'
  require 'simple_embed/image_link'
  require 'simple_embed/helpers'
  
  # stored in order, as order important to avoid collisions
  SUPPORTED_LINKS = [YouTubeLink, FlickrLink, GarminConnectLink, MapMyRideLink, VimeoLink, ImageLink]
  
  AUTO_LINK_RE = /
            (?: ([\w+.:-]+:)\/\/ | www\. )
            [^\s<]+
          /x

  class << self
    
    def auto_embed(text)
      text.to_str.gsub(AUTO_LINK_RE) do
        scheme, href = $1, $&
        punctuation = []
        # don't include trailing punctuation character as part of the URL
        while href.sub!(/[^\w\/-]$/, '')
          punctuation.push $&
          if opening = BRACKETS[punctuation.last] and href.scan(opening).size > href.scan(punctuation.last).size
            href << punctuation.pop
            break
          end
        end

        href = 'http://' + href unless scheme       
        embed_code(href)
      end
    end

    def embed_code(url)
      begin
        EmbedLinkFactory.get_embed_link(url).embed_code
      rescue
        begin
          DefaultLink.new(url).embed_code
        rescue
          url
        end
      end
    end
    
    def contains_link?(text)
      AUTO_LINK_RE.match(text)
    end
  end
end