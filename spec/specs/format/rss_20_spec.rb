require File.join(File.dirname(__FILE__), %w[.. .. spec_helper])

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

describe Rss20, "feed parser" do
  before(:each) do
    @cnn = Rss20.parse(feed(:cnn_topstories, :rss))
  end
  
  it "should parse title" do
    @cnn.title.should eql('CNN.com')
  end
  
  it "should parse link" do
    @cnn.link.should eql('http://www.cnn.com/?eref=rss_topstories')
  end
  
  it "should parse description" do
    @cnn.description.should eql('CNN.com delivers up-to-the-minute news and information on the latest top stories, weather, entertainment, politics and more.')
  end
  
  it "should parse published_at" do
    @cnn.updated_at.should eql('Thu, 29 Jan 2009 14:19:49 EST')
  end
  
  it "should parse items" do
    @cnn.items.should_not be_empty
  end
  
  it "should return a feed" do
    @cnn.should be_a(Feed)
  end
end

describe Rss20, "item parser" do
  before(:each) do
    @item = Rss20.parse(feed(:cnn_topstories, :rss)).items.first
  end
  
  it "should parse title" do
    @item.title.should eql("Recession lands men in 'Devil's Cave'")
  end
  
  it "should parse description" do
    @item.description.should match(/^Enter the "Devil's Cave" by pulling aside the wooden grate beneath the porch of the abandoned suburban New Jersey home/)
  end
  
  it "should have blank author" do
    @item.author.should be_nil # RSS doesn't support authors ya dumby!
  end
  
  it "should parse link" do
    @item.link.should eql('http://rss.cnn.com/~r/rss/cnn_topstories/~3/wpPskrTYfzg/index.html')
  end
  
  it "should parse id" do
    @item.id.should eql('http://www.cnn.com/2009/US/01/29/porch.cave/index.html?eref=rss_topstories')
  end
  
  it "should have xml" do
    @item.xml.should_not be_nil
    @item.xml.should be_a(String)
    @item.xml.should match(/^<item>/)
  end
  
  it "should have node" do
    @item.node.should_not be_nil
  end
end