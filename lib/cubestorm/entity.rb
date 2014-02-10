module Cubestorm

  class Entity

    attr_reader :position

    def initialize(position=Position.new)
      @position = position
    end

    def points
      @points ||= []
    end

    def edges
      @edges ||= []
    end

    def transformed_edge_set(transformation)
      edges.map do |edge|
        Edge.new(
          Point.from_matrix(edge.start.vector * transformation),
          Point.from_matrix(edge.terminus.vector * transformation)
        )
      end
    end

  end

end
