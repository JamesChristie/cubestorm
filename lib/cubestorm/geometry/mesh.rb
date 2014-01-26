module Cubestorm

  module Geometry

    class Mesh

      attr_reader :vertexes, :edges

      def initialize(vertexes, edges)
        @vertexes = vertexes
        @edges    = edges
      end

    end

  end

end
