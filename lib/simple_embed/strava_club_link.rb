module SimpleEmbed
  class StravaClubLink < EmbedLink
    def StravaClubLink.match_expression
      /app.strava.com\/clubs\//i
    end
  
    # using hardcoded values as strava don't scale content
    def embed_code(options={})
      "<iframe height='454' width='300' frameborder='0' allowtransparency='true' scrolling='no' src='http://app.strava.com/clubs/#{club_id}/latest-rides/71016e3886825cacbd17250ab87efa96b63bf94b?show_rides=true'></iframe>"
    end

    def club_id
      /app.strava.com\/clubs\/(?:([\w\_\-]*))/.match(@url)[1]
    end
  
  end
end