$:.push File.expand_path("../lib", __FILE__)
require "simple_embed/version"

Gem::Specification.new do |s|
  s.name        = "simple_embed"
  s.version     = SimpleEmbed::VERSION.dup
  s.platform    = Gem::Platform::RUBY 
  s.summary     = "Ruby gem for generating embed code from URLs"
  s.email       = "adam.bird@gmail.com"
  s.homepage    = "http://github.com/adambird/simple_embed"
  s.description = "Ruby gem for generating embed code from URLs"
  s.authors     = ['Adam Bird']

  s.files         = Dir["lib/**/*"]
  s.test_files    = Dir["spec/**/*"]
  s.require_paths = ["lib"]

  s.add_dependency('nokogiri', '~> 1.5')
end