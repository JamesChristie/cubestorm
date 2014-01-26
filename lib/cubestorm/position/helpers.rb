module Cubestorm

  class Position

    module Helpers

      def position_x
        position.x
      end

      def position_z=(z)
        position.z = z
      end

      def offset_x(offset)
        position.offset_x(offset)
      end

      def position_y
        position.y
      end

      def position_y=(y)
        position.y = y
      end

      def offset_y(offset)
        position.offset_y(offset)
      end

      def position_z
        position.z
      end

      def position_z=(z)
        position.z = z
      end

      def offset_z(offset)
        position.offset_z(offset)
      end

      def set_position(x, y, z)
        position.set(x, y, z)
      end

    end

  end

end
