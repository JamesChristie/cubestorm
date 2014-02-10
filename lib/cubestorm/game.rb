module Cubestorm

  module Game

    def update
      ::Cubestorm.request_halt if quit_key?
      update_cubes
      update_camera
    end

    private

    def initial_entities
      [Entity::Cube.new(Entity::Position.new(0, 0, 0, 0, 0, 0, 50))]
      # Config.cube_count.times.map do |point|
      #   Entity::Cube.new(Entity::Position.new(0, 0, 0, 0, 0, 0, 30))
      # end
    end

    def update_cubes
    end

    def update_camera
    end

    def quit_key?
      SDL::Key.press?(Config.quit_key)
    end

    def accelerate_key?
      SDL::Key.press?(Config.accelerate_key)
    end

    def decelerate_key?
      SDL::Key.press?(Config.decelerate_key)
    end

  end

end
