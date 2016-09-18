# coding: utf-8
require "minitest/autorun"

require "i18n"
require "i18n/env/config"

class TestConfig < Minitest::Test
  def setup
    I18n.config = I18n::Env::Config.new
    I18n.backend.store_translations(:"en-US", :greeting => "What it izzzz")
    I18n.backend.store_translations(:"es-MX", :greeting => "Qué onda")
    I18n.backend.store_translations(:"es-ES", :greeting => "Hola")
    I18n.backend.store_translations(:pt, :greeting => "E aí")

    I18n::Env::Config::VARS.each { |var| ENV.delete(var) }
  end

  def test_encoding_is_stripped_from_locale
    ENV["LANGUAGE"] = "es_ES.UTF-8"
    assert_equal :"es-ES", I18n.locale
  end

  def test_locale_extracted_from_LANGUAGE
    ENV["LANGUAGE"] = "es_MX"
    assert_equal :"es-MX", I18n.locale
  end

  def test_locale_extracted_from_LANG
    ENV["LANG"] = "pt"
    assert_equal :pt, I18n.locale
  end

  def test_locale_extracted_from_LC_ALL
    ENV["LC_ALL"] = "es_MX"
    assert_equal :"es-MX", I18n.locale
  end

  def test_locale_extracted_from_LC_MESSAGES
    ENV["LC_MESSAGES"] = "es_MX"
    assert_equal :"es-MX", I18n.locale
  end

  def test_LANGUAGE_priority
    ENV["LANGUAGE"] = "en_US"
    ENV["LC_ALL"] = "pt"
    ENV["LC_MESSAGES"] = "es_MX"
    ENV["LANG"] = "es_ES"
    assert_equal :"en-US", I18n.locale
  end

  def test_LC_ALL_priority
    ENV["LC_ALL"] = "pt"
    ENV["LC_MESSAGES"] = "es_MX"
    ENV["LANG"] = "es_ES"
    assert_equal :pt, I18n.locale
  end

  def test_LC_MESSAGES_priority
    ENV["LC_MESSAGES"] = "es_MX"
    ENV["LANG"] = "es_ES"
    assert_equal :"es-MX", I18n.locale
  end

  def test_LANGUAGE_with_multiple_locales
    ENV["LANGUAGE"] = "de:fr:en_US:pt_BR"
    assert_equal :"en-US", I18n.locale
  end

  def test_C_locale_ignored
    I18n::Env::Config::VARS.each { |var| ENV[var] = "C" }
    assert "C" != I18n.locale
  end

  def test_default_used_when_env_language_unsupported
    ENV["LANG"] = "de_DE"
    assert_equal I18n.default_locale, I18n.locale
  end

  def test_locale_can_be_overridden
    ENV["LANG"] = "en_US"
    I18n.locale = "es-MX"
    assert_equal :"es-MX", I18n.locale
  end

  def test_fallback_to_parent_locale_when_primary_unavailable
    ENV["LANGUAGES"] = "fr:pt_PT"
    ENV["LANG"] = "pt_BR"
    assert_equal :pt, I18n.locale
  end
end
