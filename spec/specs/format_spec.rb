require File.join(File.dirname(__FILE__), %w[.. spec_helper])

describe Format do
end

describe Format, "parser detection" do
  it "should detect RSS 2.0" do
    Format.detect(feed(:twitter, :rss)).should be(BirdFeed::Rss20)
  end
  
  it "should detect Atom 1.0" do
    Format.detect(feed(:twitter, :atom)).should be(BirdFeed::Atom10)
  end
end