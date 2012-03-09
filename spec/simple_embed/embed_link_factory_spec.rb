require 'spec_helper'

describe EmbedLinkFactory do
  describe ".get_embed_link" do
    subject { EmbedLinkFactory.get_embed_link(@url) }
    
    context "when a youtube url is passed" do
      before(:each) do
        @url = "http://www.youtube.com/watch?v=W_e4AcM65bE"
      end
      it "should return a Youtube link" do
        subject.should be_an_instance_of(YouTubeLink)
      end
    end
    
    context "when a garmin connect url is passed" do
      before(:each) do
        @url = 'http://connect.garmin.com/activity/87326928'
      end
      it "should return a GarminConnect link" do
        subject.should be_an_instance_of(GarminConnectLink)
      end
    end

    context "when an unrecognised url is passed" do
      before(:each) do
        @url = 'http://bilge.com/2183763/jshfgsjfd'
      end
      it "should return a Default link" do
        subject.should be_an_instance_of(DefaultLink)
      end
    end

    context "when a MapMyRide url is passed" do
      before(:each) do
        @url = 'http://www.mapmyride.com/routes/view/11966280'
      end
      it "should return a MapMyRideLink link" do
        subject.should be_an_instance_of(MapMyRideLink)
      end
    end
    
    context "when an jpg suffix found" do
      before(:each) do
        @url = 'http://my.website.com/picture.jpg'
      end
      it "should return a ImageLink link" do
        subject.should be_an_instance_of(ImageLink)
      end
    end

    context "when an png suffix found" do
      before(:each) do
        @url = 'http://my.website.com/picture.PNG'
      end
      it "should return a ImageLink link" do
        subject.should be_an_instance_of(ImageLink)
      end
    end

    context "when an jpg suffix found with query string" do
      before(:each) do
        @url = 'http://my.website.com/picture.jpg?size=enormous'
      end
      it "should return a ImageLink link" do
        subject.should be_an_instance_of(ImageLink)
      end
    end

  end
end
