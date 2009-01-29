require 'rubygems'
Dir.glob(File.join(File.dirname(__FILE__), %w[birdfeed *.rb])).each {|f| require f }
Dir.glob(File.join(File.dirname(__FILE__), %w[birdfeed parser *.rb])).each {|f| require f }

module BirdFeed
end

class Birdfeed
  VERSION = '1.0.0'
end