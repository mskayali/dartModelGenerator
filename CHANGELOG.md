# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/), and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.0.9] - 2024-10-21
### Added
- Initial release of the `json_to_dart_model` Dart package.
- Added functionality to generate Dart model classes from JSON input.
- Supported types: `int`, `double`, `String`, `bool`, and `dynamic`.
- Null safety included, allowing nullable fields (`int?`, `String?`, etc.).
- `fromJson` method for creating Dart models from JSON objects.
- `toJson` method for converting Dart models to JSON maps.
- `toString` method that outputs JSON string representation of the model.
- Conversion from snake_case JSON keys to camelCase Dart field names.
- Basic `lints` and `test` dev dependencies for Dart-only project setup.
