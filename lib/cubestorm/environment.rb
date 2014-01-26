module Cubestorm

  module Environment

    extend self

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

  end

end
