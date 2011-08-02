module SimpleEmbed
  class EmbedLinkFactory    
    class << self
      def get_embed_link(url)
        embed_link = nil
        SUPPORTED_LINKS.each do |link|
          if link.match_expression.match(url)
            embed_link = link.new(url)
            break
          end
        end
        embed_link.nil? ? DefaultLink.new(url) : embed_link
      end
    end
  end
end
