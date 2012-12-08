# encoding: utf-8
require 'spec_helper'

describe SimpleEmbed do
  
  describe ".auto_embed" do
    before(:each) do
      @source = "this is a http://www.youtube.com/watch?v=eOfaBZ1LohA you tube link"
      @options = {}
    end
    
    subject { SimpleEmbed.auto_embed(@source, @options) }
    
    it "generates correctly" do
      subject.should eq("this is a <iframe width=\"465\" height=\"287\" src=\"http://www.youtube.com/embed/eOfaBZ1LohA\" frameborder=\"0\" allowfullscreen></iframe> you tube link")
    end
    context "when utf8 characters" do
      before(:each) do
        @source = "£1 for BCC members and second claims, £2 if not http://www.youtube.com/watch?v=eOfaBZ1LohA you tube link"
      end
      it "generates correctly" do
        subject.should eq("£1 for BCC members and second claims, £2 if not <iframe width=\"465\" height=\"287\" src=\"http://www.youtube.com/embed/eOfaBZ1LohA\" frameborder=\"0\" allowfullscreen></iframe> you tube link")
      end
    end
    context "when set ignore markdown links" do
      before(:each) do
        @source = "this is a [My Crazy Video](http://www.youtube.com/watch?v=eOfaBZ1LohA) you tube link"
        @options = { :ignore_markdown_links => true }
      end
      it "leaves link preserved" do
        subject.should eq(@source)
      end
      context "but should work with non-markup links" do
        before(:each) do
          @source = "meanwhile, in the north sea;\r\nhttp://youtu.be/CEEoWqccAyg\r\n\r\n"
        end
        it "should embed link" do
          subject.should eq("meanwhile, in the north sea;\r\n<iframe width=\"465\" height=\"287\" src=\"http://www.youtube.com/embed/CEEoWqccAyg\" frameborder=\"0\" allowfullscreen></iframe>\r\n\r\n")
        end
      end
    end
  end
  
  describe ".contains_link?" do
    it "should recognise link" do
      SimpleEmbed.contains_link?("this is a http://www.youtube.com/watch?v=eOfaBZ1LohA you tube link").should be_true
    end
    it "should not recognise link" do
      SimpleEmbed.contains_link?("some textrt lsjdhf psdfih sdfl spsdfjhdsfkjdf kuhf f").should be_false
    end
    it "bug 1" do
      SimpleEmbed.contains_link?("meanwhile, in the north sea;\r\nhttp://youtu.be/CEEoWqccAyg\r\n\r\n").should be_true
    end
  end

end
