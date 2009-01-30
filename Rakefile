require 'rake'
require 'rubygems'
require 'spec/rake/spectask'
require './lib/birdfeed.rb'
Gem::manage_gems
require 'rake/gempackagetask'

test_files = FileList['spec/specs/*.rb', 'spec/specs/format/*.rb']

spec = Gem::Specification.new do |s|
    s.platform  =   Gem::Platform::RUBY
    s.name      =   "birdfeed"
    s.version   =   "0.1.0"
    s.author    =   "Brad Gessler"
    s.email     =   "brad@conden.se"
    s.summary   =   "A feed reader designed to normalize RSS/Atom content"
    s.files     =   FileList['lib/*.rb', 'lib/birdfeed/*.rb', 'lib/birdfeed/format/*.rb']
    s.require_path  =   "lib"
    s.autorequire   =   "birdfeed"
    s.test_files = test_files
    s.extra_rdoc_files  =   ["README.txt"]
end

Rake::GemPackageTask.new(spec) do |pkg|
    pkg.need_tar = true
end

namespace :gem do
  task :default => "pkg/#{spec.name}-#{spec.version}.gem" do
    puts "generated latest version"
  end
  
  "Destroys the latest gem"
  task :clobber do
    sh "rm pkg/#{spec.name}-#{spec.version}.gem"
  end
  
  task :install do
    sh "gem install ./pkg/#{spec.name}-#{spec.version}.gem"
  end
  
  task :uninstall do
    sh "gem uninstall #{spec.name}"
  end
end

desc "Run specs"
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = test_files
  t.spec_opts = ['--colour', '--format', 'specdoc']
end