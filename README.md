# I18n::Env::Config

Set `I18n.locale` based on the environment variables that control the locale.

This is for Desktop applications only.
For web application see [http_accept_languge](https://github.com/iain/http_accept_language) or [http-accept](https://github.com/ioquatix/http-accept).

## Usage

```ruby
require "i18n"
require "i18n/env/config"

I18n.config = I18n::Env::Config.new
```

Now `I18n.locale` will be derived from the user's environment.

## Environment Variables

The following environment variables are searched, in order:

1. `LANGUAGE`
1. `LC_ALL`
1. `LC_MESSAGES`
1. `LANG`

(Just like [gettext](https://www.gnu.org/software/gettext/manual/html_node/Locale-Environment-Variables.html#Locale-Environment-Variables)).

If an exact match is not found, the list is reevaluated using the locale's parent(s).
E.g., if `en_US` is not found, we see if `en` is available.

## Installation

Add this line to your application's Gemfile:

```ruby
gem "i18n-env-config"
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install i18n-env-config

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
