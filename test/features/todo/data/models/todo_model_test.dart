import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  final tTodoModel = TodoModel(text: 'Todo item', completed: false);

  test(
    'should be a subclass of Todo entity',
    () async {
      // assert
      expect(tTodoModel, isA<Todo>());
    },
  );

  test(
    'should return a valid TodoModel from JSON',
    () async {
      // arrange
      final Map<String, dynamic> jsonMap = json.decode(fixture('todo.json'));
      // act
      final result = TodoModel.fromJson(jsonMap);
      // assert
      expect(result, tTodoModel);
    },
  );

  test(
    'should return a JSON map as correct',
    () async {
      // act
      final result = tTodoModel.toJson();
      // assert
      final expectedJsonMap = {
        "text": "Todo item",
        "completed": false,
      };
      expect(result, expectedJsonMap);
    },
  );
}
