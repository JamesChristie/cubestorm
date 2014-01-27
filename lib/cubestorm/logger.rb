module Cubestorm

  module Logger

    extend self

    def debug(message)
      send_to_log(:debug, message)
    end

    def info(message)
      send_to_log(:info, message)
    end

    def warn(message)
      send_to_log(:warn, message)
    end

    def error(message)
      send_to_log(:error, message)
    end

    def fatal(message)
      send_to_log(:fatal, message)
    end

    private

    def send_to_log(signal, message)
      puts("#{signal.upcase}: #{message}") if Config.verbose?
      logger.public_send(signal, message)
    end

    def logger
      @logger ||= new_logger
    end

    def new_logger
      ::Logger.new(Config.log_file).tap do |log|
        log.level = log_level
      end
    end

    def log_level
      Config.debug? ? ::Logger::DEBUG : ::Logger::INFO
    end

  end

end
