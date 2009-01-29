require 'nokogiri'

module BirdFeed
  module Parser
    class Rss20 < Base
      attr_reader :xml, :doc
      
      def initialize(xml)
        @xml = xml
        @doc = Nokogiri::XML(xml)
      end
      
      def parse
        
      end
      
      class << self
        def format
          "RSS 2.0"
        end
        
        def valid?(xml)
          not Nokogiri::XML(xml).css('rss[version="2.0"]').empty?
        end
      end
    end
  end
end