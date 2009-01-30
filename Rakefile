require 'rake'
require 'rubygems'
require 'spec/rake/spectask'
require './lib/birdfeed.rb'
Gem::manage_gems
require 'rake/gempackagetask'

spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "Brad Gessler"
    s.version   =   "0.1.0"
    s.author    =   "Brad Gessler"
    s.email     =   "brad@conden.se"
    s.summary   =   "A feed reader designed to normalize RSS/Atom content"
    s.files     =   FileList['lib/*.rb', 'test/*'].to_a
    s.require_path  =   "lib"
    s.autorequire   =   "birdfeed"
    s.test_files = Dir.glob('specs/*.rb')
    s.extra_rdoc_files  =   ["README.txt"]
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end

task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
end

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/specs/*.rb', 'spec/specs/format/*.rb']
  t.spec_opts = ['--colour', '--format', 'specdoc']
end