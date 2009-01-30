require 'rubygems'
Dir.glob(File.join(File.dirname(__FILE__), %w[birdfeed *.rb])).each {|file| require file }

module BirdFeed
end