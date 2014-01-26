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

require_relative File.join('cubestorm', 'render', 'orthogonal')
require_relative File.join('cubestorm', 'render', 'perspective')

require_relative File.join('cubestorm', 'game')
require_relative File.join('cubestorm', 'viewport')
require_relative File.join('cubestorm', 'world')

require_relative File.join('cubestorm', 'entity')
require_relative File.join('cubestorm', 'entity', 'cube')
require_relative File.join('cubestorm', 'entity', 'camera')

require_relative File.join('cubestorm', 'version')

module Cubestorm

  extend self

  def execute(args)
    option_parser(args).parse!
    # TODO (jameschristie) Invoke game loop
    # The loop should be based on a singleton exit flag
    # as well as a fatal flag. In the event of a fatal
    # error, the exit flag is set and the fatal error
    # is dumped as the last action prior to exiting
    Viewport.create
    sleep(5)
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
      parser.separator ""

      parser.on("-c", "--cube-count COUNT", "Number of cubes to render") do |count|
        Config.cube_count = count.to_i
      end

      parser.on("-x", "--x-resolution RESOLUTION", "Use custom x resolution") do |res|
        Config.resolution_x = res.to_i
      end

      parser.on("-y", "--y-resolution RESOLUTION", "Use custom y resolution") do |res|
        Config.resolution_y = res.to_i
      end

      parser.on("-f", "--fullscreen", "*EXPERIMENTAL* Run in fullscreen instead of a window") do
        Config.fullscreen = true
      end

      parser.on("-o", "--orthogonal", "Use orthogonal renderer instead of perspective") do
        Config.orthogonal = true
      end

      parser.on("-v", "--verbose", "Output verbose messages") do
        Config.verbose = true
      end

      parser.on("-l", "--logfile FILENAME", "Name of the log file to use") do
        Config.verbose = true
      end

      parser.on("-h", "--help", "Display this help text") do
        # NOTE (jameschristie) Very poor control flow, this should
        # be replaced with setting the singleton exit signal to true
        # so that the normal loop exits the application prior to even
        # booting a game instance
        puts parser
        exit
      end
    end
  end

end
