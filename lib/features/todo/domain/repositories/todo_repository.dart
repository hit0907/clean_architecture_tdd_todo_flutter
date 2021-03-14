import '../entities/todo.dart';

abstract class TodoRepository {
  Future<List<Todo>> fetch();
  Future<Todo> markCompleteTodo(Todo todo);
  Future<Todo> markInCompleteTodo(Todo todo);
}
