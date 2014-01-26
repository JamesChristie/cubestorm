#!/usr/bin/env ruby

# Locate our gem
lib = File.expand_path(
  File.join(File.dirname(__FILE__), File.join('..', 'lib'))
)

# Add the gem to the load path if it's not there yet
if File.directory?(lib) && !$LOAD_PATH.include?(lib)
  $LOAD_PATH.unshift(lib)
end

# Load the gem
require 'cubestorm'

Cubestorm.execute(ARGV)
