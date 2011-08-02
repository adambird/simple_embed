require 'open-uri'
require 'nokogiri'

module SimpleEmbed
  class MapMyRideLink < EmbedLink  
    def MapMyRideLink.match_expression
      /mapmyride.com\/routes\/view\//
    end
  
    def route_id
      /mapmyride.com\/routes\/view\/(?:([\d]*))/.match(@url)[1]
    end
  
    def route_key(doc = nil)
      doc = Nokogiri::HTML(open("http://www.mapmyride.com/routes/view/mod/add_to_blog/%7B%22target%22%3A+#{route_id}%7D/form")) if doc.nil?
      doc.at_css('input#route_key').attributes['value'].value
    end
  
    def embed_code
      "<!-- Start MMF Embed Tool --><iframe id=\"mmf_blog_map\" src=\"http://js.mapmyfitness.com/embed/blogview.html?r=#{route_key}&u=e&t=ride\" height=\"500px\" width=\"400px\" frameborder=\"0\"><a href=\"http://www.mapmyride.com/routes/view/#{route_id}\">MapMyRide Route</a></iframe><!-- End MMF Embed Tool -->"
    end
  end
end