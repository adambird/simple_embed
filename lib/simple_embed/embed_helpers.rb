module SimpleEmbed
  class EmbedHelpers

    AUTO_LINK_RE = /
              (?: ([\w+.:-]+:)\/\/ | www\. )
              [^\s<]+
            /x
                      
    def EmbedHelpers.auto_embed(text)
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
  end
end