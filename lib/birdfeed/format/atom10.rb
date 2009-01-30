require 'nokogiri'

module BirdFeed
  class Atom10 < Format
    attr_reader :xml, :doc
    
    def initialize(xml)
      @xml = xml
      @doc = Nokogiri::XML(xml)
    end
    
    class << self
      def format
        "Atom 1.0"
      end
      
      def valid?(xml)
        # We have to use HTML for crappily formatted feeds.. like uh... Twitters!
        not Nokogiri::HTML(xml).search('feed[xmlns="http://www.w3.org/2005/Atom"]').empty?
      end
    end
  end
end