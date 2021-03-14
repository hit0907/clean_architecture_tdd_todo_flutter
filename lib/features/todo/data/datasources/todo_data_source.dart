import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';

abstract class TodoDataSource {
  Future<List<TodoModel>> fetch();
  Future<TodoModel> markCompleteTodo(Todo todo);
  Future<TodoModel> markInCompleteTodo(Todo todo);
}
