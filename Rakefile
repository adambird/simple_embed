# encoding: utf-8

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "simple_embed"
  gem.homepage = "http://github.com/adam.bird/simple_embed"
  gem.license = "MIT"
  gem.summary = "Simple embedding for the Bunch Rides project"
  gem.description = "Could use Embedly but don't support all of the links we want and this seems simple enough to do"
  gem.email = "adam.bird@gmail.com"
  gem.authors = ["Adam Bird"]
  # dependencies defined in Gemfile
  # gem.files         = `git ls-files lib`.split("\n") + ['README.rdoc', 'LICENSE']
  # gem.test_files    = `git ls-files test`.split("\n")
  # gem.require_paths = ['lib']
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'
Rake::TestTask.new(:test) do |test|
  test.libs << 'lib' << 'test'
  test.pattern = 'test/**/*.rb'
  test.verbose = true
end

require 'rcov/rcovtask'
Rcov::RcovTask.new do |test|
  test.libs << 'test'
  test.pattern = 'test/**/*.rb'
  test.verbose = true
  test.rcov_opts << '--exclude "gems/*"'
end

task :default => :test

require 'rdoc/task'
RDoc::Task.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "simple_embed #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
