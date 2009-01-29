require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])
include Parser

describe Rss20 do
  it "should be 'RSS 2.0' format" do
    Rss20.format.should eql("RSS 2.0")
  end
end

describe Rss20, "validity" do
  it "should be valid if RSS 2.0" do
    Rss20.should be_valid(feed(:twitter, :rss))
  end
  
  it "should not be valid if not RSS 2.0" do
    Rss20.should_not be_valid(feed(:twitter, :atom))
  end
end

describe Rss20, "parser" do
  it "should parse title"
  
  it "should parse author"
  
  it "should parse updated_at"
  
  it "should parse items"
end