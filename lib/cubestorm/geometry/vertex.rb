module Cubestorm

  module Geometry

    class Vertex

      include Position::Helpers

      attr_reader :position

      def initialize(x, y, z)
        @position = Position.new(x, y, z)
      end

    end

  end

end
