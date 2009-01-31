require 'nokogiri'

module BirdFeed
  class Atom10 < Format
    class << self
      def format
        "Atom 1.0"
      end
      
      def parse(content)
        Nokogiri::parse(content) do |xml|
          return Feed.new(self) do |feed|
            feed.namespaces = xml.css('feed').first.attributes.inject({}) do |namespaces, attribute|
              key, value = attribute
              namespaces[key.to_s] = value.to_s if key =~ /^xmlns/
              namespaces
            end
            feed.raw_content = content
            feed.title = xml.css('feed > title').text
            feed.description = xml.css('feed > subtitle').text
            feed.link = xml.css('feed > link').first.get_attribute('href')
            feed.updated_at = xml.css('feed > updated').text
            xml.css('feed > entry').each do |item_node|
              feed.items << Item.new do |item|
                item.xml = item_node.to_xml
                item.node = item_node
                item.title = item_node.css('title').text
                item.description = item_node.css('content').text
                item.published_at = item_node.css('published').text
                item.link = item_node.css('link').attr('href')
                item.id = item_node.css('id').text
                item.author = item_node.css('author > name').text
              end
            end
          end
        end
      end
      
      def valid?(xml)
        not Nokogiri::parse(xml).search('feed[xmlns="http://www.w3.org/2005/Atom"]').empty?
      end
    end
  end
end