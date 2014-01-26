module Cubestorm

  class Game

    attr_reader :viewport, :step

    def self.run
      game = new
    end

    def initialize
      @viewport = Viewport.create
    end

    def step
    end

    private

    def update
    end

    def render
    end

    def renderer
      Config.orthogonal? ? Orthogonal : Perspective
    end

  end

end
