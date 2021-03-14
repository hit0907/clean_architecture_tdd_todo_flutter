import 'package:flutter/material.dart';
import 'package:clean_architecture_tdd_todo_flutter/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';

class FetchTodo implements UseCase<List<Todo>, NoParams> {
  final TodoRepository repository;

  FetchTodo(this.repository);

  Future<List<Todo>> call(NoParams params) {
    return this.repository.fetch();
  }
}

class Params {
  final int pageNumber;

  Params({@required this.pageNumber});
}
