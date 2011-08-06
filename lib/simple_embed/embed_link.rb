module SimpleEmbed
  class EmbedLink
    def initialize(url)
      @url = url
    end
    
    # width is the key dimension from which height is calculated
    def embed_width
      465
    end

    def aspect_ratio
      1
    end
    
    def embed_height
      (embed_width / aspect_ratio).round
    end
    
  end
end