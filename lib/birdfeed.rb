require 'rubygems'
%w(feed format item).each do |file|
  require File.join(File.dirname(__FILE__), %w[birdfeed], file)
end

module BirdFeed
end