require "spec_helper"

describe EmbedLink do
  describe "#embed_height" do
    before(:each) do
      @link = EmbedLink.new("http://my.website.com/some/link/to/something.html")
    end
    
    subject { @link.embed_height }
    
    context "when aspect_ratio overriden" do
      before(:each) do
        @link.aspect_ratio = 1.62
      end
      
      it "returns 287" do
        subject.should eq(287)
      end
    end
  end
end