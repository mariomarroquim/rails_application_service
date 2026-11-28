# Changelog

All notable changes to this project are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- `abstract_class!` declares a service class as abstract, so it cannot be instantiated or called,
  and `abstract_class?` tells whether a class was declared abstract

## [0.7.0] - 2026-11-23

### Changed
- Excluded development files from the packaged gem

### Breaking Changes
- Ruby 4.0 or later is now required (previously Ruby 2.2)
- ActiveModel 8.0 or later is now required (previously ActiveModel 4.2)
- Unimplemented services now raise `ApplicationService::NotImplementedError`, a `StandardError`, instead of Ruby's built-in `NotImplementedError`

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
