require 'logger'
require 'optparse'
require 'matrix'

require 'sdl'

require_relative File.join('cubestorm', 'errors', 'cubefault')
require_relative File.join('cubestorm', 'errors', 'setting_not_configured')

require_relative File.join('cubestorm', 'config', 'options')
require_relative File.join('cubestorm', 'config')
require_relative File.join('cubestorm', 'config', 'option_definitions')

require_relative File.join('cubestorm', 'timer')
require_relative File.join('cubestorm', 'game')
require_relative File.join('cubestorm', 'engine')
require_relative File.join('cubestorm', 'transformation')
require_relative File.join('cubestorm', 'renderer')


require_relative File.join('cubestorm', 'entity')
require_relative File.join('cubestorm', 'entity', 'point')
require_relative File.join('cubestorm', 'entity', 'position')
require_relative File.join('cubestorm', 'entity', 'edge')
require_relative File.join('cubestorm', 'entity', 'cube')
require_relative File.join('cubestorm', 'entity', 'camera')

require_relative File.join('cubestorm', 'command_line')
require_relative File.join('cubestorm', 'logger')

require_relative File.join('cubestorm', 'version')

module Cubestorm

  extend self

  TITLE     = 'Cubestorm'
  CUBE_ROOT = File.join(File.expand_path(File.dirname(__FILE__)), '..')

  def execute(args)
    CommandLine.parse(args)
    exit if shutdown?

    init_systems

    Engine.new.tap do |game|
      game.run
      game.cleanup
    end
  end

  def config(&block)
    block_given? ? yield(Config) : Config
  end

  def request_halt
    @shutdown = true
  end

  def shutdown?
    @shutdown ||= false
  end

  private

  def init_systems
    SDL.init(SDL::INIT_VIDEO)
    SDL::TTF.init
  end

end
