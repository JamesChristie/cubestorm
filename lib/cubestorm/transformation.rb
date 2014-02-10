module Cubestorm

  module Transformation

    extend self

    def project(camera, entities)
      if Config.orthogonal?
        entities.map { |entity| orthographic_edge_set(camera, entity) }.flatten
      else
        entities.map { |entity| perspective_edge_set(camera, entity) }.flatten
      end
    end

    def orthographic_edge_set(camera, entity)
      entity.transformed_edge_set(
        orthographic_transform(camera, entity.position)
      )
    end

    def perspective_edge_set(camera, entity)
      entity.transformed_edge_set(
        perspective_transform(camera, entity.position)
      )
    end

    private

    def orthographic_transform(camera, entity_position)
      world(entity_position) * camera(camera.position) * orthographic(camera)
    end

    def perspective_transform(camera, entity_position)
      world(entity_position) * camera(camera.position) * perspective(camera)
    end

    def world(position)
      offset(position) * scale(position) * x_rotation(position) *
        y_rotation(position) * z_rotation(position)
    end

    def camera(position)
      camera_rotation(position.angle_z) * offset(position)
    end

    def orthographic(camera)
      Matrix[
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
      ]
    end

    def perspective(camera)
      Matrix[
        [width_range(camera), 0, 0, 0],
        [0, height_range(camera), 0, 0],
        [0, 0, near_clip(camera), -1],
        [0, 0, far_clip(camera), 0]
      ]
    end

    def offset(position)
      Matrix[
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [position.x, position.y, position.z, 1]
      ]
    end

    def scale(position)
      Matrix[
        [position.scale, 0, 0, 0],
        [0, position.scale, 0, 0],
        [0, 0, position.scale, 0],
        [0, 0, 0, 1]
      ]
    end

    def x_rotation(position)
      Matrix[
        [1, 0, 0, 0],
        [0, Math.cos(position.angle_z), Math.sin(position.angle_z), 0],
        [0, -Math.sin(position.angle_z), Math.cos(position.angle_z), 0],
        [0, 0, 0, 1]
      ]
    end

    def y_rotation(position)
      Matrix[
        [Math.cos(position.angle_z), 0, -Math.sin(position.angle_z), 0],
        [0, 1, 0, 0],
        [Math.sin(position.angle_z), 0, Math.cos(position.angle_z), 0],
        [0, 0, 0, 1]
      ]
    end

    def z_rotation(position)
      Matrix[
        [Math.cos(position.angle_z), Math.sin(position.angle_z), 0, 0],
        [Math.sin(position.angle_z), Math.cos(position.angle_z), 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
      ]
    end

    def camera_rotation(angle)
      Matrix[
        [Math.cos(-angle), Math.sin(-angle), 0, 0],
        [-Math.sin(-angle), Math.cos(-angle), 0, 0],
        [0, 0, 1, 0],
        [0, 0, 0, 1]
      ]
    end

    def offset(position)
      Matrix[
        [1, 0, 0, 0],
        [0, 1, 0, 0],
        [0, 0, 1, 0],
        [-position.x, -position.y, -position.z, 1]
      ]
    end

    def width_range(camera)
      (2 * camera.near_clip) / camera.width
    end

    def height_range(camera)
      (2 * camera.near_clip) / camera.height
    end

    def near_clip(camera)
      -(camera.far_clip + camera.near_clip) / (camera.far_clip - camera.near_clip)
    end

    def far_clip(camera)
      -2 * (camera.far_clip * camera.near_clip) / (camera.far_clip - camera.near_clip)
    end

  end

end
