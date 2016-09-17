require "i18n"

module I18n
  module Env
    class Config < I18n::Config
      VERSION = "0.0.1"

      # Order is important
      VARS = %w[LANGUAGE LC_ALL LC_MESSAGES LANG]

      def locale
        @locale ||= find_user_locale || super
      end

      private

      def find_user_locale
        find_primary || find_secondary
      end

      def find_primary
        locales.find { |l| I18n.locale_available?(l) }
      end

      def find_secondary
        tag = nil

        locales.each do |l|
          tag = I18n::Locale::Tag.tag(l).parents.map(&:to_sym).find { |parent| I18n.locale_available?(parent) }
          break if tag
        end

        tag
      end

      def locales
        @locales ||= VARS.reject { |name| !ENV[name] || ENV[name] == "C" }.flat_map do |name|
          # LANGUAGE's value can be delimited by ":"
          ENV[name].split(":").map { |l| normalize(l) }
        end
      end

      def normalize(lang)
        # Remove encoding
        lang = lang.split(".").first
        lang.tr!("_", "-")
        lang.to_sym
      end
    end
  end
end
