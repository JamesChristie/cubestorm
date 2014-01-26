module Cubestorm

  module Errors

    class SettingNotConfigured < Cubefault

      def initialize(method_name)
        super("No value has been specified for option: #{method_name}")
      end

    end

  end

end
