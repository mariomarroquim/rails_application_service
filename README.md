# Rails Application Service

Service objects for Rails - the Rails way. This Ruby gem adds service objects to Rails applications.

## Installation

**1 - Add the gem to the Rails application's Gemfile by entering:**

```bash
bundle add rails_application_service
```

**2 - Install the gem into the Rails application's directory by running:**

```bash
bundle install
```

**3 - Create an `app/services` subdirectory in the Rails application's directory by running:**
```bash
mkdir -p app/services
```

## Usage

The `ApplicationService::Base` class provides a standard interface for calling service objects with robust type handling and validations. It leverages `ActiveModel::API` for initialization with keyword arguments, `ActiveModel::Attributes` for type casting, and `ActiveModel::Validations` for input validation.

### Example of a basic service:
```ruby
require "application_service"

class MyService < ApplicationService::Base
  def call
    # Perform the service action
  end
end

my_service = MyService.call # nil
```

### Example of a service:
```ruby
require "application_service"

class Sum < ApplicationService::Base
  attribute :number_a, :integer
  attribute :number_b, :integer

  validates :number_a, :number_b, presence: true, numericality: { greater_than: 0 }

  def call
    number_a + number_b
  end
end

sum = Sum.call(number_a: 1, number_b: 2) # => 3
```

### Available attribute types

This gem supports the following attribute types through `ActiveModel::Attributes` and other custom types defined in `ActiveModel::Type`:

- `:boolean`
- `:date`
- `:datetime`
- `:decimal`
- `:float`
- `:integer`
- `:string`
- `:time`

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mariomarroquim/rails_application_service. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mariomarroquim/rails_application_service/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ApplicationService project's codebases, issue trackers, chat rooms, and mailing lists is expected to follow the [code of conduct](https://github.com/mariomarroquim/rails_application_service/blob/main/CODE_OF_CONDUCT.md).

## Support

You can contact me at mariomarroquim@gmail.com.
