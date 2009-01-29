module BirdFeed
  module Parser
    class Base
      @@registered_parsers = [ Parser::Rss20 ]
      
      class << self
        attr_reader :format
        
        # Grab all of the sub classes and work our way up...
        def detect(xml)
          @registered_parsers.detect do |parser|
            parser.valid?(xml)
          end
        end
        
        # Add a parser to the registered parsers list.
        def register(parser)
          @registered_parsers << parser
        end
        
        def valid?(xml)
          # Run some hearistics on a feed to make sure the format is correct for the class
          nil
        end
      end
    end
  end
end