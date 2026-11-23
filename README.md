# Rails Application Service

This Ruby gem adds service classes (e.g., use cases, features, or commands) to Ruby on Rails web applications.

## Instructions

Requires Ruby 4.0 or later and Rails (ActiveModel) 8.0 or later.

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

## Usage examples

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

`Sum.call` returns `false` when validation fails. A service that does not define `call` raises `ApplicationService::NotImplementedError`.

## Support

You can contact me at mariomarroquim@gmail.com.
