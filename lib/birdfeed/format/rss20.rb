require 'nokogiri'

module BirdFeed
  class Rss20 < Format
    class << self
      def format
        "RSS 2.0"
      end
      
      def parse(content)
        Nokogiri::parse(content) do |xml|
          return Feed.new(self) do |feed|
            feed.raw_content = content
            feed.title = xml.css('rss > channel > title').text
            feed.description = xml.css('rss > channel > description').text
            feed.link = xml.css('rss > channel > link').text
            feed.updated_at = xml.css('rss > channel > pubDate').text
            xml.css('rss > channel item').each do |item_node|
              feed.items << Item.new do |item|
                item.xml = item_node.to_xml
                item.node = item_node
                item.title = item_node.css('title').text
                item.description = item_node.css('description').text
                item.link = item_node.css('link').text
                item.id = item_node.css('guid').text
              end
            end
          end
        end
      end
      
      def valid?(content)
        not Nokogiri::parse(content).css('rss[version="2.0"]').empty?
      end
    end
  end
end