## [Unreleased]

## [0.2.0] - 2025-04-04

### Added
- Added support for `ActiveModel::API` and `ActiveModel::Attributes`
- Type casting through `ActiveModel::Attributes`
- Improved validation through `ActiveModel::Validations`

### Changed
- Service initialization uses keyword arguments exclusively
- Improved error messages and documentation
- Enhanced example code in docstrings

### Removed
- Support for positional arguments in the `call` method

### Breaking Changes
- Services must now use keyword arguments instead of positional arguments
- All existing services using positional arguments need to be updated

## [0.1.0] - 2025-02-04

- Initial release
