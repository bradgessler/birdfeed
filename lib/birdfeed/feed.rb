module BirdFeed
  class Feed
    attr_accessor :title, :link, :description, :updated_at, :publisher, :xml, :items, :raw_content
    
    def initialize(format, &block)
      @items = []
      @format = format
      yield self if block_given?
    end
    
    class << self
      def parse(content)
        Format.detect(content).parse(content)
      end
    end
  end
end