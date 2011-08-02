module SimpleEmbed
  class GarminConnectLink < EmbedLink
    def GarminConnectLink.match_expression
      /connect.garmin.com/
    end
  
    def embed_code
      "<iframe width=\"465\" height=\"548\" frameborder=\"0\" src=\"http://connect.garmin.com:80/activity/embed/#{activity_id}\"></iframe>"
    end

    def activity_id
      /connect.garmin.com\/activity\/(?:([\d]*))/.match(@url)[1]
    end
  end
end