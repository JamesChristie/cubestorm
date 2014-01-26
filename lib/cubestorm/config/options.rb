module Cubestorm

  module Config

    module Options

      extend self

      def reset
        settings.replace(defaults)
      end

      def defaults
        @defaults ||= {}
      end

      def settings
        @settings ||= {}
      end

      def raise_not_configured(method_name)
        raise Errors::SettingNotConfigured.new(method_name)
      end

      def option(name, options={})
        defaults[name] = settings[name] = options[:default]

        class_eval <<-RUBY
          def #{name}
           raise_not_configured(#{name.inspect}) if settings[#{name.inspect}].nil?
           settings[#{name.inspect}]
          end

          def #{name}=(value)
            settings[#{name.inspect}] = value
          end

          def #{name}?
            !!settings[#{name.inspect}]
          end

          def default_#{name}!
            settings[#{name.inspect}] = defaults[#{name.inspect}]
          end

          def #{name}_default_value
            defaults[#{name.inspect}]
          end
        RUBY
      end

    end

  end

end
