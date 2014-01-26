module Cubestorm

  class Game

    attr_reader :viewport, :timer

    def initialize
      @viewport = Viewport.create
      @timer    = Timer.new
    end

    def run
      while continue_running? do
        timer.tick
        parse_input
        update_game
        render
      end
    end

    def step
      parse_input
      update_game
      render
    end

    private

    def update
    end

    def render
    end

    def renderer
      Config.orthogonal? ? Orthogonal : Perspective
    end

    def continue_running?
      !Environment.shutdown?
    end

  end

end
