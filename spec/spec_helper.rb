require 'rubygems'
require 'spec'
require File.join(File.dirname(__FILE__), %w[.. lib birdfeed])
include BirdFeed # Drop into our own namespace

def feed(name,format=:rss)
  name = name.to_s
  unless name =~ /\.(\w+)$/ # If there's a file extension, then don't try to force a format
    # Otherwise we want to read the format arg
    name = "#{name}.#{format}"
  end
  File.read File.join(File.dirname(__FILE__), %w[fixtures], name)
end