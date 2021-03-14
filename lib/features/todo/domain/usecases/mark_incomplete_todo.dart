import 'package:clean_architecture_tdd_todo_flutter/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';

class MarkInCompleteTodo implements UseCase<Todo, Todo> {
  final TodoRepository repository;

  MarkInCompleteTodo(this.repository);

  @override
  Future<Todo> call(Todo todo) {
    return this.repository.markInCompleteTodo(todo);
  }
}
