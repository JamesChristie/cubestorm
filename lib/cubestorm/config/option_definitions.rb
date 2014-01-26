module Cubestorm

  Config.option :verbose,    default: false
  Config.option :orthogonal, default: false

  Config.option :resolution_x, default: 640
  Config.option :resolution_y, default: 480
  Config.option :color_depth,  default: 32
  Config.option :fullscreen,   default: false

  Config.option :log_file, default: 'cubestorm.log'

  Config.option :cube_count, default: 5

end
