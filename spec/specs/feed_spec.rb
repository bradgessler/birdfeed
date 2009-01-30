require File.join(File.dirname(__FILE__), %w[.. spec_helper])

describe Feed, "parse" do
  it "should parse RSS 2.0" do
    Feed.parse(feed(:twitter, :rss)).should be_an_instance_of(Feed)
  end
  
  it "Should parse Atom 1.0" do
    Feed.parse(feed(:twitter, :atom)).should be_an_instance_of(Feed)
  end
end