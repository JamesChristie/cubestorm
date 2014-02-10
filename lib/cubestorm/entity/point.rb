module Cubestorm

  class Entity

    class Point

      attr_accessor :x, :y, :z

      def self.from_matrix(matrix)
        new(*matrix.row(0).to_a[0..2])
      end

      def initialize(x=0, y=0, z=0)
        place(x, y, z)
      end

      def place(x, y, z)
        self.x, self.y, self.z = x, y, z
      end

      def duplicate
        Point.new(x, y, z)
      end

      def vector
        Matrix.row_vector([x, y, z, 1])
      end

    end

  end

end
