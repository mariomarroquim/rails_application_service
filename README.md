# Rails Application Service

This Ruby gem adds service classes (e.g., use cases, features, or commands) to Ruby on Rails web applications.

## Installation

**1 - Add the gem to your Rails application's Gemfile:**

```bash
bundle add rails_application_service
```

**2 - Install the gem by running:**

```bash
bundle install
```

**3 - Create an `app/services` directory in your Rails application:**

```bash
mkdir -p app/services
```

## Usage

The `ApplicationService::Base` class provides a standard interface for calling services. It leverages `ActiveModel` for initialization with keyword arguments and input validation.

### Basic service example

```ruby
class MyService < ApplicationService::Base
  def call
    # Perform the service action
  end
end

my_service = MyService.call # nil
```

### Example with attributes and validations

```ruby
class Sum < ApplicationService::Base
  attr_accessor :number_a, :number_b

  validates :number_a, :number_b, presence: true, numericality: { greater_than: 0 }

  def call
    number_a + number_b
  end
end

sum = Sum.call(number_a: 1, number_b: 2) # => 3
```

## Contributing

Bug reports and pull requests are welcome on GitHub: [mariomarroquim/rails_application_service](https://github.com/mariomarroquim/rails_application_service). This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to follow the [Code of Conduct](https://github.com/mariomarroquim/rails_application_service/blob/main/CODE_OF_CONDUCT.md).

## Development

After checking out the repository, run `bin/setup` to install dependencies. Then run `rake spec` to execute the test suite. You can also run `bin/console` to open an interactive prompt for experimentation.

To install this gem on your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, then run `bundle exec rake release`. This command creates a git tag for the version, pushes the commits and tag, and publishes the `.gem` file to [RubyGems.org](https://rubygems.org).

## License

This gem is available as open source under the terms of the [MIT License](https://github.com/mariomarroquim/rails_application_service/blob/main/LICENSE.txt).

## Support

You can contact me at mariomarroquim@gmail.com.
