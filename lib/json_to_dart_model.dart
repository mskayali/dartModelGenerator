library json_to_dart_model_plus;

class JsonToDartModel {
  String modelName;
  Map<String, dynamic> jsonInput;
  bool addName;

  JsonToDartModel(
      {required this.modelName, required this.jsonInput, this.addName = true});

  String generateModel() {
    StringBuffer buffer = StringBuffer();

    // Start the class definition
    buffer.writeln("class $modelName {");

    // Add fields, allowing nullability by adding '?' to types
    jsonInput.forEach((key, value) {
      String fieldType;
      if (value is int) {
        fieldType = 'int?';
      } else if (value is double) {
        fieldType = 'double?';
      } else if (value is String) {
        fieldType = 'String?';
      } else if (value is bool) {
        fieldType = 'bool?';
      } else {
        fieldType =
            'dynamic'; // Fallback to dynamic for unknown or complex types
      }

      String fieldName = key.contains('_') ? _snakeToCamel(key) : key;
      buffer.writeln('  $fieldType $fieldName;');
    });

    // Add constructor
    buffer.write('  $modelName({');
    jsonInput.forEach((key, value) {
      String fieldName = key.contains('_') ? _snakeToCamel(key) : key;
      buffer.write('this.$fieldName, ');
    });
    buffer.writeln('});');

    // Add fromJson method with null safety checks
    buffer.writeln();
    buffer.writeln(
        '  factory  $modelName.fromJson(Map<String, dynamic>? json) => $modelName(');
    jsonInput.forEach((key, value) {
      String fieldName = key.contains('_') ? _snakeToCamel(key) : key;
      buffer.writeln("    $fieldName : json?['$key'],");
    });
    buffer.writeln('  );');

    // Add toJson method with null checks
    buffer.writeln();
    buffer.writeln('  Map<String, dynamic> toJson() {');
    buffer.writeln(
        '    final Map<String, dynamic> data = new Map<String, dynamic>();');
    jsonInput.forEach((key, value) {
      String fieldName = key.contains('_') ? _snakeToCamel(key) : key;
      buffer.writeln("    if (this.$fieldName != null) {");
      buffer.writeln("      data['$key'] = this.$fieldName;");
      buffer.writeln("    }");
    });
    buffer.writeln('    return ${addName ? '{"$modelName":data}' : 'data'};');
    buffer.writeln('  }');

    // Add toString method that converts toJson() to string
    buffer.writeln();
    buffer.writeln('  @override');
    buffer.writeln('  String toString() {');
    buffer.writeln('    return toJson().toString();');
    buffer.writeln('  }');

    // End the class definition
    buffer.writeln('}');

    return buffer.toString();
  }

  String _snakeToCamel(String snakeCase) {
    return snakeCase
        .split('_')
        .asMap()
        .map((index, word) {
          if (index == 0) {
            return MapEntry(index, word);
          } else {
            return MapEntry(index, word[0].toUpperCase() + word.substring(1));
          }
        })
        .values
        .join('');
  }
}
