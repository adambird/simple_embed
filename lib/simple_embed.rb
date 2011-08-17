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

module SimpleEmbed
  # stored in order, as order important to avoid collisions
  SUPPORTED_LINKS = [YouTubeLink, FlickrLink, GarminConnectLink, MapMyRideLink, VimeoLink, ImageLink]

end