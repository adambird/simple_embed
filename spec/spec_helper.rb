require 'rake'
require 'rspec'
require "#{Rake.application.original_dir}/lib/simple_embed"

include SimpleEmbed

def open_file(name)
  File.open("#{Rake.application.original_dir}/spec/support/#{name}")
end