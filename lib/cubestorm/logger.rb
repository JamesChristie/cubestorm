module Cubestorm

  module Logger

    extend self

    def debug(message)
      logger.debug(message)
    end

    def info(message)
      logger.info(message)
    end

    def warn(message)
      logger.warn(message)
    end

    def error(message)
      logger.error(message)
    end

    def fatal(message)
      logger.fatal(message)
    end

    private

    def logger
      @logger ||= new_logger
    end

    def new_logger
      ::Logger.new(Config.log_file).tap do |log|
        log.level = ::Logger::DEBUG
      end
    end

  end

end
