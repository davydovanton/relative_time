# RelativeTime
[![Build Status](https://travis-ci.org/davydovanton/relative_time.svg?branch=master)](https://travis-ci.org/davydovanton/relative_time) [![Code Climate](https://codeclimate.com/github/davydovanton/relative_time/badges/gpa.svg)](https://codeclimate.com/github/davydovanton/relative_time) [![Test Coverage](https://codeclimate.com/github/davydovanton/relative_time/badges/coverage.svg)](https://codeclimate.com/github/davydovanton/relative_time/coverage)

Micro lib without any dependency for getting relative time.


## Motivation
I love rails but sometimes we need to create web apps (or CLI) without rails and AS. That's why I created `#time_ago_in_words` analog on pure ruby without any dependencies.

## Installation
Add this line to your application's Gemfile:

```ruby
gem 'relative_time'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install relative_time

## Usage
Just call `#in_words` method with any time object:

```ruby
RelativeTime.in_words(Date.today)
RelativeTime.in_words(Time.now)          # => less than a minute

RelativeTime.in_words(Time.now - 1 * 60) # => a minute ago
RelativeTime.in_words(Time.now - 3 * 60) # => 3 minutes ago

RelativeTime.in_words(Time.now + 1 * 60) # => in a minute
RelativeTime.in_words(Time.now + 3 * 60) # => in 3 minutes
```

Also you can use second argument as a from date:

```ruby
date_from = Time.now - 60 * 60 # one hour ago
RelativeTime.in_words(Time.now, date_from)          # => an hour ago
```

### Supported intervals

* minutes
* hours
* days
* weeks
* months
* years

### I18n
Relative time use [i18n](https://github.com/ruby-i18n/i18n) for pluralization and translation to other languages. For using specific locale just call `#in_words` with specific locale:

```ruby
RelativeTime.in_words(Time.now, locale: :ru)            # => через 3 часа
RelativeTime.in_words(Time.now, date_from, locale: :ru) # => минуту назад
```

List of supported locales:

* `en`
* `id`
* `ru`
* `tr`
* `uk`
* `be`
* `pt`
* `fa`

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/davydovanton/relative_time. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
