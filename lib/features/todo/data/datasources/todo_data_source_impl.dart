import 'dart:async';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/datasources/todo_data_source.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';

// Fix me: please change it
// Mock remote data source to implement later
// More https://resocoder.com/2019/10/03/flutter-tdd-clean-architecture-course-9-remote-data-source/
class TodoDataSourceImpl implements TodoDataSource {
  @override
  Future<List<TodoModel>> fetch() async {
    List<TodoModel> todos = [];
    for (var i = 0; i < 20; i++) {
      todos.add(TodoModel(text: "Todo item $i", completed: i % 2 == 1));
    }
    return todos;
  }

  @override
  Future<TodoModel> markCompleteTodo(Todo todo) async {
    return TodoModel(text: todo.text, completed: true);
  }

  @override
  Future<TodoModel> markInCompleteTodo(Todo todo) async {
    return TodoModel(text: todo.text, completed: false);
  }
}
