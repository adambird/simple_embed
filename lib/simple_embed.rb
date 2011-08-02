require 'simple_embed/embed_link'
require 'simple_embed/embed_link_factory'
require 'simple_embed/flickr_link'
require 'simple_embed/garmin_connect_link'
require 'simple_embed/map_my_ride_link'
require 'simple_embed/vimeo_link'
require 'simple_embed/you_tube_link'
require 'simple_embed/default_link'

module SimpleEmbed
  SUPPORTED_LINKS = [YouTubeLink, FlickrLink, GarminConnectLink, MapMyRideLink, VimeoLink]
end