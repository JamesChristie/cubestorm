module Cubestorm

  class Entity

    class Edge

      attr_accessor :start, :terminus

      def initialize(start, terminus)
        @start    = start
        @terminus = terminus
      end

      def copy_geometry
        Edge.new(
          Point.new(start.x, start.y, start.z),
          Point.new(terminus.x, terminus.y, terminus.z)
        )
      end

    end

  end

end
