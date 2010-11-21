# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "sass_on_heroku_with_rack/version"

Gem::Specification.new do |s|
  s.name        = "sass_on_heroku_with_rack"
  s.version     = SassOnHerokuWithRack::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ryan Dy"]
  s.email       = ["ryan.dy@gmail.com"]
  s.homepage    = "http://github.com/sass_on_heroku_with_rack"
  s.summary     = %q{Runs sass on heroku using rack middleware}
  s.description = %q{Runs sass on heroku using rack middleware. This takes advantage of heroku's varnish to refresh the stylsehet.'}

  s.rubyforge_project = "sass_on_heroku_with_rack"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
