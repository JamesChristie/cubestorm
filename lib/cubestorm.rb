require 'logger'
require 'optparse'

require 'sdl'

require_relative File.join('cubestorm', 'errors', 'cubefault')
require_relative File.join('cubestorm', 'errors', 'setting_not_configured')

require_relative File.join('cubestorm', 'config', 'options')
require_relative File.join('cubestorm', 'config')
require_relative File.join('cubestorm', 'config', 'option_definitions')

require_relative File.join('cubestorm', 'logger')
require_relative File.join('cubestorm', 'environment')
require_relative File.join('cubestorm', 'viewport')
require_relative File.join('cubestorm', 'world')
require_relative File.join('cubestorm', 'timer')
require_relative File.join('cubestorm', 'game')

require_relative File.join('cubestorm', 'position')
require_relative File.join('cubestorm', 'position', 'helpers')

require_relative File.join('cubestorm', 'geometry', 'vertex')
require_relative File.join('cubestorm', 'geometry', 'edge')
require_relative File.join('cubestorm', 'geometry', 'mesh')

require_relative File.join('cubestorm', 'render', 'orthogonal')
require_relative File.join('cubestorm', 'render', 'perspective')

require_relative File.join('cubestorm', 'entity')
require_relative File.join('cubestorm', 'entity', 'cube')
require_relative File.join('cubestorm', 'entity', 'camera')

require_relative File.join('cubestorm', 'command_line')

require_relative File.join('cubestorm', 'version')

module Cubestorm

  extend self

  def execute(args)
    CommandLine.parse(args)
    exit if Environment.shutdown?

    Game.new.tap do |game|
      game.run
      game.cleanup
    end
  end

  def config(&block)
    block_given? ? yield(Config) : Config
  end

end
