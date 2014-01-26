module Cubestorm

  module Viewport

    extend self

    def create
      @viewport = SDL.set_video_mode(
        Config.resolution_x,
        Config.resolution_y,
        Config.color_depth,
        render_surface
      )
    end

    def destroy
      @viewport.destroy
    end

    private

    def render_surface
      Config.fullscreen? ? SDL::FULLSCREEN : SDL::SWSURFACE
    end

  end

end
