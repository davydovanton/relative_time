# RelativeTime
Simple lib without any dependensy for getting relative time

## Motivation

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
Just call `#in_words` method:

```ruby
RelativeTime.in_words(Time.now)          # => less than a minute

RelativeTime.in_words(Time.now - 1 * 60) # => a minute ago
RelativeTime.in_words(Time.now - 3 * 60) # => 3 minutes ago

RelativeTime.in_words(Time.now + 1 * 60) # => in a minute
RelativeTime.in_words(Time.now + 3 * 60) # => in 3 minutes
```

## Contributing
Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/relative_time. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

