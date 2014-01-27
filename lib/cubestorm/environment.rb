module Cubestorm

  module Environment

    extend self

    def process_events
      while event_stack.length > 0 do
        event_stack.shift.process
      end
    end

    def request_shutdown
      flags[:shutdown] = true
    end

    def shutdown?
      flags[:shutdown] ||= false
    end

    def to_s
      @flags.to_s
    end

    private

    def flags
      @flags ||= {}
    end

    def event_stack
      @event_stack ||= []
    end

  end

end
