# Changelog

All notable changes to this project are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0] - unreleased

### Changed
- Excluded development files from the packaged gem

### Breaking Changes
- Ruby 4.0 or later is now required (previously Ruby 2.2)
- ActiveModel 8.0 or later is now required (previously ActiveModel 4.2)

## [0.6.2] - 2025-08-02

### Changed
- `ApplicationService::Base` now includes `ActiveModel::Model` instead of `ActiveModel::API`, `ActiveModel::Attributes` and `ActiveModel::Validations`

### Breaking Changes
- Removed `ActiveModel::Attributes` support: services must declare inputs with `attr_accessor` instead of `attribute`, and inputs are no longer type cast

## [0.4.0] - 2025-06-05

### Added
- Typed attributes through `ActiveModel::Attributes`

### Breaking Changes
- Services now take keyword arguments instead of positional arguments

## [0.2.0] - 2025-02-04

### Added
- Input validation through `ActiveModel::Validations`

## [0.1.0] - 2025-02-04

### Added
- Initial release
