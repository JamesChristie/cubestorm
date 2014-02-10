module Cubestorm

  class Entity

    class Camera < Entity

      LOOK_AT_LOCATION = [0, 0, 0]
      CAMERA_LOCATION  = [-100, -100, -100]
      FIELD_OF_VIEW    = 90
      NEAR_CLIP        = 100
      FAR_CLIP         = 2500

      attr_reader :look_at

      def initialize
        @look_at = Point.new(*LOOK_AT_LOCATION)
        super(Position.new(*CAMERA_LOCATION))
      end

      def fov
        FIELD_OF_VIEW
      end

      def near_clip
        NEAR_CLIP
      end

      def far_clip
        FAR_CLIP
      end

      def width
        -2 * near_clip * Math.tan(fov / 2)
      end

      def height
        width * (Config.resolution_x / Config.resolution_y)
      end

    end

  end

end
