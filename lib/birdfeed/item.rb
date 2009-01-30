module BirdFeed
  class Item
    attr_accessor :node, :xml, :title, :link, :description, :published_at, :id, :author
    
    def initialize(&block)
      yield self if block_given?
    end
  end
end