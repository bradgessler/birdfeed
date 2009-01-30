# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{birdfeed}
  s.version = "0.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Brad Gessler"]
  s.date = %q{2009-01-30}
  s.description = %q{An RSS/Atom reader based on the Nokogiri XML parser for Ruby}
  s.email = %q{brad@conden.se}
  s.files = ["README.txt", "VERSION.yml", "lib/birdfeed", "lib/birdfeed/feed.rb", "lib/birdfeed/format", "lib/birdfeed/format/atom10.rb", "lib/birdfeed/format/rss20.rb", "lib/birdfeed/format.rb", "lib/birdfeed/formats.rb", "lib/birdfeed/item.rb", "lib/birdfeed.rb", "spec/fixtures", "spec/fixtures/cnn_topstories.rss", "spec/fixtures/flickr.atom", "spec/fixtures/twitter.atom", "spec/fixtures/twitter.rss", "spec/spec_helper.rb", "spec/specs", "spec/specs/bird_feed_spec.rb", "spec/specs/feed_spec.rb", "spec/specs/format", "spec/specs/format/atom_10_spec.rb", "spec/specs/format/rss_20_spec.rb", "spec/specs/format_spec.rb"]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/bradgessler/crapapp}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{BirdFeed is a well tested RSS parsing library that uses the Nokogiri XML parser in an attempt to normalize the concept of an Atom and RSS feed. We wrote this library to solve the problem ofconsuming several different feed types for a moderation tool.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<nokogiri>, [">= 1.1.1"])
    else
      s.add_dependency(%q<nokogiri>, [">= 1.1.1"])
    end
  else
    s.add_dependency(%q<nokogiri>, [">= 1.1.1"])
  end
end
