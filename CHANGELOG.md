# Changelog

All notable changes to this project are documented in this file.

The format follows [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.7.0] - 2026-11-21

### Added
- AGENTS.md with guidance for coding agents (CLAUDE.md links to it)

### Changed
- Updated Ruby version and gems
- Simplified the Readme

### Fixed
- Changelog URI in the gem metadata
- Development files (including the CLAUDE.md symlink) are no longer packaged in the gem

### Removed
- GitHub Actions CI workflow

### Breaking Changes
- Services now raise `ApplicationService::NotImplementedError` (a `StandardError`) instead of Ruby's built-in `NotImplementedError` (a `ScriptError`) when `Base` is instantiated directly or `call` is not implemented, so a bare `rescue` now catches it

## [0.6.3] - 2026-05-07

### Added

### Changed
- Updated Ruby version and gems
- Improved the gem summary and description
- Improved the Readme

### Removed

### Breaking Changes

## [0.6.2] - 2025-08-02

### Added

### Changed
- Simplified docs

### Removed

### Breaking Changes

## [0.6.1] - 2025-06-18

### Added

### Changed
- Enhanced the changelog

### Removed

### Breaking Changes

## [0.6.0] - 2025-06-18

### Added

### Changed
- Enhanced the changelog

### Removed

### Breaking Changes

## [0.5.0] - 2025-06-18

### Added

### Changed
- Improved code documentation and README
- Refactored and simplified test specs
- Fixed Rubocop offenses
- Updated dependencies

### Removed

### Breaking Changes

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

### Added

### Changed
- Refactored source code and tests

### Removed

### Breaking Changes

## [0.2.0] - 2025-02-04

### Added

### Changed
- Refactored source code and tests

### Removed

### Breaking Changes

## [0.1.0] - 2025-02-04

### Added
- Initial release

### Changed

### Removed

### Breaking Changes
