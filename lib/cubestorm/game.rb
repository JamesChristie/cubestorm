module Cubestorm

  class Game

    def initialize(renderer)
      @world    = World.new
      @camera   = Camera.new
      @renderer = renderer.new
    end

  end

end
