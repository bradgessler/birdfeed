require 'rake'
require 'rubygems'
require 'spec/rake/spectask'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |s|
    s.name = "birdfeed"
    s.summary = %Q{BirdFeed is a well tested RSS parsing library that uses the Nokogiri XML parser in an attempt to normalize the concept of an Atom and RSS feed. We wrote this library to solve the problem ofconsuming several different feed types for a moderation tool.}
    s.email = "brad@conden.se"
    s.homepage = "http://github.com/bradgessler/crapapp"
    s.description = "An RSS/Atom reader based on the Nokogiri XML parser for Ruby"
    s.authors = ["Brad Gessler"]
  end
rescue LoadError
  puts "Jeweler not available. Install it with: sudo gem install technicalpickles-jeweler -s http://gems.github.com"
end

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/specs/*.rb', 'spec/specs/format/*.rb']
  t.spec_opts = ['--colour', '--format', 'specdoc']
end