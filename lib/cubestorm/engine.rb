module Cubestorm

  class Engine

    include Game

    attr_reader :timer, :camera, :renderer, :entities

    def initialize
      @timer    = Timer.new
      @camera   = Entity::Camera.new
      @renderer = Renderer.new
      @entities = initial_entities
    end

    def run
      while !::Cubestorm.shutdown? do
        step
      end
    end

    def cleanup
      renderer.destroy
    end

    def step
      observe_events
      update
      set_debug_text
      display_world
      timer.tick
    end

    private

    def observe_events
      SDL::Event.poll
      SDL::Key.scan
    end

    def set_debug_text
      renderer.set_text("Framerate: #{timer.framerate.round(1)}\n")
    end

    def display_world
      renderer.project(
        Transformation.project(camera, entities)
      )
    end

  end

end
