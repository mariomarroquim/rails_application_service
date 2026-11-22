# Changelog

All notable changes to this project are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0] - unreleased

### Changed
- Fixed the changelog link in the gem metadata
- Excluded development files from the packaged gem
- Simplified the README
- Updated dependencies

### Breaking Changes
- Ruby 4.0 or later is now required (previously Ruby 2.2)
- ActiveModel 8.0 or later is now required (previously ActiveModel 4.2)

## [0.6.3] - 2026-05-07

### Changed
- Improved the README, license and gemspec
- Updated Ruby version and dependencies

## [0.6.2] - 2025-08-02

### Changed
- Simplified docs
- Improved code documentation
- Fixed RuboCop offenses
- Updated dependencies
- `ApplicationService::Base` now includes `ActiveModel::Model` instead of `ActiveModel::API`, `ActiveModel::Attributes` and `ActiveModel::Validations`

### Removed
- Removed `ActiveModel::Attributes` support, including the `attribute` declarations and type casting added in 0.4.0

### Breaking Changes
- Services that declare inputs with `attribute` must switch to `attr_accessor`, and inputs are no longer type cast

## [0.6.1] - 2025-06-18

### Changed
- Improved the changelog

## [0.6.0] - 2025-06-18

### Changed
- Improved code documentation, README and changelog

## [0.5.0] - 2025-06-18

### Changed
- Improved code documentation and README
- Refactored and simplified test specs
- Fixed RuboCop offenses
- Updated dependencies

## [0.4.0] - 2025-06-05

### Added
- Added support for `ActiveModel::API` and `ActiveModel::Attributes`
- Enabled type casting through `ActiveModel::Attributes`
- Added validation via `ActiveModel::Validations`

### Changed
- Service initialization now exclusively uses keyword arguments
- Improved error messages and documentation
- Enhanced example code in docstrings

### Removed
- Removed support for positional arguments in the `call` method

### Breaking Changes
- Services must now use keyword arguments instead of positional arguments
- All existing services using positional arguments need to be updated

## [0.3.0] - 2025-02-05

### Changed
- Refactored source code and tests

## [0.2.0] - 2025-02-04

### Changed
- Refactored source code and tests

## [0.1.0] - 2025-02-04

### Added
- Initial release
