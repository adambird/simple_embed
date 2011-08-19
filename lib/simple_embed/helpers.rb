module SimpleEmbed
  class Helpers
    AUTO_LINK_RE = /
              (?: ([\w+.:-]+:)\/\/ | www\. )
              [^\s<]+
            /x
                  
    def self.auto_embed(text)
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
        EmbedLinkFactory.get_embed_link(href).embed_code
      end
    end

    def self.embed_code(url)
      EmbedLinkFactory.get_embed_link(url).embed_code
    end
    
    def self.contains_link?(text)
      AUTO_LINK_RE.match(text)
    end
  end
end