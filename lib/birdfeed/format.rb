module BirdFeed
  class Format
    class << self
      @@registered_formats = []
      
      # Grab all of the sub classes and work our way up...
      def detect(content)
        @@registered_formats.detect do |format|
          format.valid?(content)
        end
      end
      
      # Add a format to the registered formats list.
      def register(format)
        @@registered_formats << format
      end
      
      # Return a list of formats available in BirdFeed
      def registered_formats
        @@registered_formats
      end
    end
  end
end

Dir.glob(File.join(File.dirname(__FILE__), %w[format *.rb])).each {|file| require file }
require File.join(File.dirname(__FILE__), 'formats.rb')