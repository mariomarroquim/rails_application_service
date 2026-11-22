# Rails Application Service

Rails Application Service is a Ruby gem adds service classes (e.g., use cases, features, or commands) to Ruby on Rails web applications.

## Commands

- `bin/setup`: install dependencies
- `bundle exec rake`: default task, runs specs and then RuboCop (this is what CI runs)
- `bundle exec rspec`: run the test suite
- `bundle exec rspec spec/sum_service_spec.rb:15`: run a single example by file and line
- `bundle exec rspec --only-failures`: rerun failures (status is kept in `.rspec_status`)
- `bundle exec rubocop` (`-a` to autocorrect): lint
- `bin/console`: IRB with the gem loaded
- `bundle exec rake install` / `bundle exec rake release`: install locally / tag, push and publish to RubyGems (bump `lib/application_service/version.rb` first)

## Architecture

This is a tiny gem. All the behavior lives in `ApplicationService::Base` in `lib/application_service.rb`.

- **Naming:** the gem is published as `rails_application_service`, but the module is `ApplicationService`, the require path is `application_service`, and the gemspec is `application_service.gemspec`.
- **ActiveModel only:** `Base` includes `ActiveModel::Model`, so subclasses get keyword-argument initialization (`attr_accessor` attributes) and `validates`. The only runtime dependency is `activemodel >= 4.2`. The gem does not depend on Rails itself.
- **The `call` contract:** the class method `Base.call(**kwargs)` builds an instance, returns `false` if `valid?` fails, and otherwise returns the result of the instance's `call`. The service instance (and its `errors`) is thrown away, so callers get only the return value or `false`.
- **Abstract base:** creating a `Base` directly raises Ruby's built-in `NotImplementedError`, and so does a subclass that does not override `#call`. Note that this is a `ScriptError`, so a bare `rescue` or `rescue StandardError` will not catch it.
- **Specs as subclasses:** specs define small concrete subclasses inline (for example, `SumService` in `spec/sum_service_spec.rb`) to exercise the base class.

## Constraints

- **Old Ruby support:** the gemspec declares `required_ruby_version >= 2.2`, and RuboCop targets Ruby 2.2 (`TargetRubyVersion: 2.2`). Library code must avoid newer syntax and APIs. The dev Ruby in `.ruby-version` and the CI Ruby in `.github/workflows/main.yml` are much newer.
- **Style:** use double-quoted strings and `# frozen_string_literal: true` in every Ruby file. RuboCop enforces both, with `NewCops: enable`.
- **Packaging:** gem contents come from `git ls-files` (minus `bin/`, `spec/`, `.git*`, `.github`, `Gemfile*` and the gemspec), so a new file under `lib/` must be committed before it ships.
- **Changes:** record user-facing changes in `CHANGELOG.md`. Type signatures live in `sig/application_service.rbs`.

## Conventions

- Don't add any new dependencies without asking first.
- If the code changes, sync both `AGENTS.md` and `README.md` as well.
- Don't commit and push changes unless explicitly required.
- This project only uses the `main` branch; commit and push directly to it.
