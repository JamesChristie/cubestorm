module Cubestorm

  class Timer

    MAX_SAMPLES = 20

    attr_reader :frame_limit, :start, :ticks, :tick_length

    def self.wait(time)
      start = SDL.getTicks

      SDL.delay(time)
      SDL.getTicks - start
    end

    def initialize
      SDL.init(SDL::INIT_TIMER)

      if Config.frame_limit && Config.frame_limit > 0
        @frame_limit = Config.frame_limit
      else
        @frame_limit = Config.frame_limit_default_value
      end

      @start       = SDL.getTicks
      @ticks       = 0
      @samples     = []
      @tick_length = 1000.0 / @frame_limit
    end

    def lifetime
      SDL.getTicks - start
    end

    def framerate
      (1000.0 * @samples.length) / sample_period
    rescue ZeroDivisionError
      0.0
    end

    def frametime
      sample_period / @samples.length
    rescue ZeroDivisionError
      0.0
    end

    def tick
      passed = 0

      if @last_tick
        passed += SDL.getTicks - @last_tick
      end

      extra = @tick_length - passed
      if extra > 0 
        passed += self.class.wait(extra)
      end

      puts "ticked #{passed}"
      passed
    ensure
      @last_tick  = SDL.getTicks
      @ticks     += 1

      @samples.push(passed)
      @samples.shift if @samples.length > 20
    end

    private

    def sample_period
      @samples.inject(0) do |sum, sample|
        sum + sample
      end
    end

  end

end
