import 'package:meta/meta.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/datasources/todo_data_source.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';

class TodoRepositoryImpl extends TodoRepository {
  final TodoDataSource dataSource;

  TodoRepositoryImpl({@required this.dataSource});

  @override
  Future<List<Todo>> fetch() {
    return dataSource.fetch();
  }

  @override
  Future<Todo> markCompleteTodo(Todo todo) {
    return dataSource.markCompleteTodo(todo);
  }

  @override
  Future<Todo> markInCompleteTodo(Todo todo) {
    return dataSource.markInCompleteTodo(todo);
  }
}
