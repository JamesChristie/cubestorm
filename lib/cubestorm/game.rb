module Cubestorm

  class Game

    attr_reader :screen, :timer

    def initialize
      @screen = Viewport.create
      @timer  = Timer.new

      @renderer = selected_renderer
    end

    def run
      while continue_running? do
        step
      end
    end

    def cleanup
    end

    def step
      Input.parse
      Environment.process_events
      @renderer.update(screen)
    end

    private

    def update
    end

    def render
    end

    def selected_renderer
      Config.orthogonal? ? Renderer::Orthogonal.new : Renderer::Perspective.new
    end

    def continue_running?
      !Environment.shutdown?
    end

  end

end
