require 'spec_helper'

describe VimeoLink do
  describe "#video_id" do

    subject { VimeoLink.new("http://vimeo.com/5951947").video_id }
    
    it "should equal 5951947" do
      subject.should eq("5951947")
    end
  end
end
