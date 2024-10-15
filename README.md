# Dart Model Generator from JSON

This Dart project generates Dart model classes from a given JSON structure. It takes a JSON object as input and outputs a Dart class with:
- Fields that match the JSON structure
- A constructor
- `fromJson` method for parsing JSON into the model
- `toJson` method for serializing the model back to JSON
- Handles null safety, allowing fields and the JSON input itself to be null.

## Features

- Automatically converts snake_case JSON keys into camelCase Dart field names.
- Supports `int`, `double`, `String`, `bool`, and `dynamic` types.
- Nullable fields (`?`) for null safety.
- Optional inclusion of fields when serializing if the field is `null`.

## How It Works

1. **Field Types**: The generator automatically infers the field types (e.g., `int`, `String`) from the JSON values.
2. **Null Safety**: All fields are nullable (`int?`, `String?`) to handle incomplete or null JSON data.
3. **fromJson Method**: This method converts a JSON object into the Dart model, with null checks for each field.
4. **toJson Method**: This method converts the Dart model back to JSON, excluding null fields.

## Example

Given the following input JSON:

```json
  {
    "key1": "value1",
    "key2": 123,
    "key3": null,
    "key4": true,
    "key5": 0.3
  }
```
Exemple dart code:
```dart
import 'dart:convert';

void main() {
  String modelName = 'MyModel';
  String jsonString = '''
  {
    "key1": "value1",
    "key2": 123,
    "key3": null,
    "key4": true,
    "key5": 0.3
  }
  ''';

  Map<String, dynamic> jsonInput = jsonDecode(jsonString);
  String modelCode = JsonToDartModel(modelName: modelName, jsonInput: jsonInput)
      .generateModel();

  print(modelCode);
}
```
