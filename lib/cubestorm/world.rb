module Cubestorm

  class World

    attr_reader :camera, :entities

    def initialize(camera, entities)
      @camera   = camera
      @entities = entities
    end

  end

end
