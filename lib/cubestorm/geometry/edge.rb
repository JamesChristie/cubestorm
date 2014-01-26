module Cubestorm

  module Geometry

    class Edge

      attr_reader :start, :end

      def initialize(start, finish)
        @start  = start
        @finish = finish
      end

    end

  end

end
