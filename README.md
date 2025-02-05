# ApplicationService

Service objects for Rails - the Rails way. This Ruby gem adds service objects to Rails applications.

## Installation

**1 - Add the gem to the Rails application's Gemfile by entering:**

```yaml
gem "application_service", git: "https://github.com/mariomarroquim/application_service"
```

**2 - Install the gem into the Rails application's directory by running:**

```bash
bundle install
```

**3 - Create a `app/services` subdirectory into the Rails application's directory by running:**
```bash
mkdir -p app/services
```

## Usage

The `ApplicationService::Base` class provides a standard interface for calling service objects. It defines a class method `call` that initializes a new instance of the service object and invokes its `call` instance method. The `call` method can accept any number of arguments, which are passed to the initializer of the service object. You can define attributes and validations just like in Active Record, using the same syntax and conventions.

### Example of a basic service:

Create an `app/services` subdirectory into the Rails application's one with your service by running:
```ruby
class MyService < ApplicationService::Base
  def call
    # Perform the service action
  end
end

my_service = MyService.call # nil
```

### Example of a more complete service:
```ruby
class Sum < ApplicationService::Base
  attr_accessor :number_a, :number_b

  validates :number_a, :number_b, presence: true, numericality: { only_integer: true, greater_than: 0 }

  def initialize(number_a, number_b)
    super

    self.number_a = number_a
    self.number_b = number_b
  end

  def call
    (number_a + number_b)
  end
end

sum = Sum.call(1, 2) # 2
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mariomarroquim/application_service. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mariomarroquim/application_service/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ApplicationService project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mariomarroquim/application_service/blob/main/CODE_OF_CONDUCT.md).

## Support

You can contact me at mariomarroquim@gmail.com.
