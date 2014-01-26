module Cubestorm

  module CommandLine

    extend self

    def parse(args)
      option_parser(args).parse!
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

        parser.on("-F", "--frame-limit LIMIT", "Upper limit of FPS for the game loop") do |limit|
          Config.frame_limit = limit.to_i
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

        parser.on("-V", "--version", "Output version number") do
          puts VERSION
          Environment.request_shutdown
        end

        parser.on("-h", "--help", "Display this help text") do
          puts parser
          Environment.request_shutdown
        end

        parser.separator ""
      end
    end

  end

end
