require 'rake'
require 'rubygems'
require 'hoe'
require './lib/birdfeed.rb'
require 'spec/rake/spectask'

Hoe.new('birdfeed', Birdfeed::VERSION) do |p|
  p.rubyforge_name = 'birdfeed' # if different than lowercase project name
  p.summary = "A dead simple RSS/Atom parser that is not in denial that XML is underneath."
  p.developer('Brad Gessler', 'brad@conden.se')
end

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/birdfeed/**/*.rb']
  t.spec_opts = ['--colour', '--format', 'specdoc']
end