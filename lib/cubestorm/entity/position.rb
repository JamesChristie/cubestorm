module Cubestorm

  class Entity

    class Position < Point

      attr_accessor :angle_x, :angle_y, :angle_z, :scale

      def initialize(x=0, y=0, z=0, ax=0, ay=0, az=0, scale=1)
        orient(ax, ay, az)
        self.scale = scale
        super(x, y, z)
      end

      def rotate(x, y, z)
        self.angle_x += x
        self.angle_y += y
        self.angle_z += z
      end

      def orient(x, y, z)
        self.angle_x, self.angle_y, self.angle_z = x, y, z
      end

    end

  end

end
