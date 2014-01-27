module Cubestorm

  module Environment

    class Event

      attr_reader :target, :signal, :args

      def initialize(target, signal, args)
      end

      def process
        target.public_send(signal, *args)
      end

    end

  end

end
