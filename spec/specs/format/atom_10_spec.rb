require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

describe Atom10 do
  it "should be 'RSS 2.0' format" do
    Atom10.format.should eql("Atom 1.0")
  end
end

describe Atom10, "validity" do
  it "should be valid if Atom 1.0" do
    Atom10.should be_valid(feed(:twitter, :atom))
  end
  
  it "should not be valid if not Atom 1.0" do
    Atom10.should_not be_valid(feed(:twitter, :rss))
  end
end

describe Atom10, "feed parser" do
  before(:each) do
    @cnn = Atom10.parse(feed(:twitter, :atom))
  end
  
  it "should parse title" do
    @cnn.title.should eql('Twitter / bradgessler')
  end
  
  it "should parse link" do
    @cnn.link.should eql('http://twitter.com/bradgessler')
  end
  
  it "should parse description" do
    @cnn.description.should eql("Twitter updates from Brad Gessler / bradgessler.")
  end
  
  it "should parse updated_at" do
    @cnn.updated_at.should eql('2009-01-29T20:11:53+00:00')
  end
  
  it "should parse items" do
    @cnn.items.should_not be_empty
  end
  
  it "should return a feed" do
    @cnn.should be_a(Feed)
  end
end

describe Atom10, "item parser" do
  before(:each) do
    @item = Atom10.parse(feed(:twitter, :atom)).items.first
  end
  
  it "should parse title" do
    @item.title.should eql("bradgessler: Why doesn't ruby have a decent RSS parser lib? Looks like I get to roll my own...")
  end
  
  it "should parse description" do
    @item.description.should eql("bradgessler: Why doesn't ruby have a decent RSS parser lib? Looks like I get to roll my own...")
  end
  
  it "should have author" do
    @item.author.should eql('Brad Gessler')
  end
  
  it "should parse link" do
    @item.link.should eql('http://twitter.com/bradgessler/statuses/1159405159')
  end
  
  it "should parse id" do
    @item.id.should eql('tag:twitter.com,2007:http://twitter.com/bradgessler/statuses/1159405159')
  end
  
  it "should have xml" do
    @item.xml.should_not be_nil
    @item.xml.should be_a(String)
    @item.xml.should match(/^<entry>/)
  end
  
  it "should have node" do
    @item.node.should_not be_nil
  end
end