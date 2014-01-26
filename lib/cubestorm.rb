require 'optparse'
require 'sdl'

require_relative File.join('cubestorm', 'errors', 'cubefault')
require_relative File.join('cubestorm', 'errors', 'setting_not_configured')

require_relative File.join('cubestorm', 'config', 'options')
require_relative File.join('cubestorm', 'config')
require_relative File.join('cubestorm', 'config', 'option_definitions')

require_relative File.join('cubestorm', 'geometry', 'node')
require_relative File.join('cubestorm', 'geometry', 'edge')
require_relative File.join('cubestorm', 'geometry', 'mesh')

require_relative File.join('cubestorm', 'entity')
require_relative File.join('cubestorm', 'entity', 'cube')
require_relative File.join('cubestorm', 'entity', 'camera')

require_relative File.join('cubestorm', 'render', 'orthogonal')
require_relative File.join('cubestorm', 'render', 'perspective')

require_relative File.join('cubestorm', 'world')
require_relative File.join('cubestorm', 'game')

require_relative File.join('cubestorm', 'version')

module Cubestorm

  extend self

  def execute(args)
    option_parser(args).parse!
  end

  def config(&block)
    block_given? ? yield(Config) : Config
  end

  private

  def option_parser(args)
    OptionParser.new do |parser|
      parser.banner = "Cubestorm Usage: cubestorm [OPTIONS]"

      parser.separator ""
      parser.separator "An example of SDL and software rasterization in Ruby"
      parser.separator ""
      parser.separator "Options:"

      parser.on("-o", "--orthogonal", "Use orthogonal renderer instead of perspective") do
        Config.orthogonal = true
      end

      parser.on("-v", "--verbose", "Output verbose messages") do
        Config.verbose = true
      end

      parser.on("-h", "--help", "Display this help text") do
        puts parser
        exit # NOTE (jameschristie) Very poor control flow
      end
    end
  end

end
