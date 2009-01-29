require File.join(File.dirname(__FILE__), %w[.. spec_helper])
include Parser

describe Base do
  # Base parser can't be valid because there's nothing to validate!
  it "should not be valid" do
    Base.should_not be_valid(feed(:twitter))
  end
  
  it "should have format" do
    Base.should respond_to(:format)
  end
  
  it "should have a nil format" do
    Base.format.should be_nil
  end
end

describe Base, "parser detection" do
  it "should detect RSS 2.0" do
    Base.detect(feed(:twitter, :rss)).should be_a(Rss20)
  end
  
  it "should detect Atom 1.0"
end