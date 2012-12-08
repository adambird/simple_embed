module SimpleEmbed
  require 'simple_embed/embed_link'
  require 'simple_embed/embed_link_factory'
  require 'simple_embed/flickr_link'
  require 'simple_embed/garmin_connect_link'
  require 'simple_embed/strava_club_link'
  require 'simple_embed/map_my_ride_link'
  require 'simple_embed/vimeo_link'
  require 'simple_embed/you_tube_link'
  require 'simple_embed/default_link'
  require 'simple_embed/image_link'
  require 'simple_embed/helpers'
  
  # stored in order, as order important to avoid collisions
  SUPPORTED_LINKS = [YouTubeLink, FlickrLink, GarminConnectLink, StravaClubLink, MapMyRideLink, VimeoLink, ImageLink]
  
  AUTO_LINK_RE = /((http(s)?:\/\/)|www\.)[^\s<]+/x

  BRACKETS = { ']' => '[', ')' => '(', '}' => '{' }

  class << self
    
    # Inject embed codes for the recognised links in the passed text
    #
    # === Parameters
    #
    # [text (String)] the text to parse
    # [options (Hash)] optional settings
    #   { :ignore_markdown_links => true }
    #
    # === Returns
    #
    # [String] the text with recognised links embeded
    #
    def auto_embed(text, options={})
      text.to_str.gsub(AUTO_LINK_RE) do
        match_data, scheme, href = $~, $1, $&

        if options[:ignore_markdown_links]
          preceding_character_index = match_data.begin(0) - 1
          next href if preceding_character_index >= 0 && text[preceding_character_index] == "("
        end

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
    
    # Generate the embed code for a url
    #
    # === Parameters
    #
    # [url (String)] the url to inspect
    #
    # === Returns
    #
    # [String] the HTML embed code for the link
    #
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