module BirdFeed
  class Feed
    attr_reader :title, :link, :updated_at, :description, :guid, :author, :parser
    
    def initialize(xml='', options={})
      @xml = xml
      @items = []
      @parser = Parser.detect(xml)
    end
    
    def items
    end
    
    def format
      @parser.class.format
    end
    
    alias :entries :items
    alias :id :guid
    
  protected
    # Detects and returns the format of the feed
    def format
      
    end
  end
end