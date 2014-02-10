module Cubestorm

  class Entity

    class Cube < Entity

      def initialize(position=Position.new)
        point0 = Point.new(-1, -1, -1)
        point1 = Point.new(-1, -1,  1)
        point2 = Point.new(-1,  1, -1)
        point3 = Point.new(-1,  1,  1)
        point4 = Point.new( 1, -1, -1)
        point5 = Point.new( 1, -1,  1)
        point6 = Point.new( 1,  1, -1)
        point7 = Point.new( 1,  1,  1)

        @points = [
          point0, point1, point2, point3,
          point4, point5, point6, point7
        ]

        edge00 = Edge.new(point0, point1)
        edge01 = Edge.new(point1, point3)
        edge02 = Edge.new(point3, point2)
        edge03 = Edge.new(point2, point0)
        edge04 = Edge.new(point4, point5)
        edge05 = Edge.new(point5, point7)
        edge06 = Edge.new(point7, point6)
        edge07 = Edge.new(point6, point4)
        edge08 = Edge.new(point3, point7)
        edge09 = Edge.new(point1, point5)
        edge10 = Edge.new(point0, point4)
        edge11 = Edge.new(point2, point6)

        @edges = [
          edge00, edge01, edge02, edge03,
          edge04, edge05, edge06, edge07,
          edge08, edge09, edge10, edge11
        ]

        super(position)
      end

    end

  end

end
