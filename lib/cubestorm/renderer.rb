module Cubestorm

  class Renderer

    FONT_SIZE = 24

    def initialize
      @screen = SDL.set_video_mode(
        Config.resolution_x,
        Config.resolution_y,
        Config.color_depth,
        render_surface
      )

      @font = SDL::TTF.open(File.join(CUBE_ROOT, 'font', 'ubuntu-title.ttf'), FONT_SIZE)
      SDL::WM.set_caption(TITLE, '')
    end

    def project(subjects)
      clear_buffer
      draw_world(subjects)
      draw_text
      @screen.flip
    end

    def destroy
      @screen.destroy
    end

    def set_text(text)
      @text_surface = @font.render_solid_utf8(text, 255, 255, 255)
    end

    private

    attr_reader :text_surface

    def render_surface
      Config.fullscreen? ? SDL::FULLSCREEN : SDL::SWSURFACE
    end

    def draw_world(edges)
      edges.each do |edge|
        draw_line(
          -edge.start.x, -edge.start.y,
          -edge.terminus.x, -edge.terminus.y
        )

        draw_vertex(-edge.start.x, -edge.start.y)
        draw_vertex(-edge.terminus.x, -edge.terminus.y)
      end
    end

    def draw_text
      SDL.blit_surface(text_surface, 0, 0, 0, 0, @screen, 0, 0) if text_surface
    end

    def buffer_color
      @buffer_color ||= @screen.format.mapRGB(0, 0, 0)
    end

    def shape_color
      @line_color ||= @screen.format.mapRGB(175, 175, 175)
    end

    def clear_buffer
      @screen.fill_rect(0, 0, Config.resolution_x, Config.resolution_y, buffer_color)
    end

    def draw_vertex(x, y)
      @screen.draw_filled_circle(x, y, 7, shape_color)
    end

    def draw_line(x1, y1, x2, y2)
      @screen.draw_line(x1, y1, x2, y2, shape_color)
    end

  end

end
