module Cubestorm

  Config.option :verbose, default: false
  Config.option :debug,   default: false

  Config.option :resolution_x, default: 1024
  Config.option :resolution_y, default: 768
  Config.option :color_depth,  default: 32
  Config.option :fullscreen,   default: false
  Config.option :orthogonal,   default: false

  Config.option :log_file, default: 'cubestorm.log'

  Config.option :cube_count, default: 5

  Config.option :frame_limit, default: 60

  Config.option :quit_key,       default: SDL::Key::ESCAPE
  Config.option :accelerate_key, default: SDL::Key::Z
  Config.option :decelerate_key, default: SDL::Key::X

end
