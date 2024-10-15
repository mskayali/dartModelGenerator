import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:json_to_dart_model/json_to_dart_model.dart';

void main() {
  test('adds one to input values', () {


    String modelName = 'EdmGroup';
    String jsonString = '''
  {
    "id": 9,
    "disabled": 0,
    "type": "default",
    "description": "1",
    "title": "1",
    "theme_id": 19,
    "order": 1
  }
  ''';

    Map<String, dynamic> jsonInput = jsonDecode(jsonString);
    String modelCode = JsonToDartModel(modelName: modelName, jsonInput: jsonInput).generateModel();

    expect(modelCode,
    
'''class EdmGroup {
  int? id;
  int? disabled;
  String? type;
  String? description;
  String? title;
  int? themeId;
  int? order;

  EdmGroup({this.id, this.disabled, this.type, this.description, this.title, this.themeId, this.order});

  EdmGroup.fromJson(Map<String, dynamic>? json) {
    id = json?['id'];
    disabled = json?['disabled'];
    type = json?['type'];
    description = json?['description'];
    title = json?['title'];
    themeId = json?['theme_id'];
    order = json?['order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.id != null) {
      data['id'] = this.id;
    }
    if (this.disabled != null) {
      data['disabled'] = this.disabled;
    }
    if (this.type != null) {
      data['type'] = this.type;
    }
    if (this.description != null) {
      data['description'] = this.description;
    }
    if (this.title != null) {
      data['title'] = this.title;
    }
    if (this.themeId != null) {
      data['theme_id'] = this.themeId;
    }
    if (this.order != null) {
      data['order'] = this.order;
    }
    return data;
  }
}'''

    
    );
  });
}
