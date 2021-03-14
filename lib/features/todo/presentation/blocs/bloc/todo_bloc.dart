import 'dart:async';

import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/fetch_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_complete_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_incomplete_todo.dart';

part 'todo_event.dart';

class TodoBloc extends Bloc<TodoEvent, List<Todo>> {
  final FetchTodo fetchTodo;
  final MarkCompleteTodo markCompleteTodo;
  final MarkInCompleteTodo markInCompleteTodo;

  TodoBloc({
    @required FetchTodo fetch,
    @required MarkCompleteTodo markComplete,
    @required MarkInCompleteTodo markInComplete,
  })  : fetchTodo = fetch,
        markCompleteTodo = markComplete,
        markInCompleteTodo = markInComplete,
        super([]);

  @override
  Stream<List<Todo>> mapEventToState(
    TodoEvent event,
  ) async* {
    if (event is TodoEventFetch) {
      yield (await fetchTodo(NoParams()));
    } else if (event is TodoEventCompleted) {
      yield _updateTodos(event.todo, await markCompleteTodo(event.todo));
    } else if (event is TodoEventInCompleted) {
      yield _updateTodos(event.todo, await markInCompleteTodo(event.todo));
    }
  }

  List<Todo> _updateTodos(Todo todo, Todo newTodo) {
    var newTodos = [...state];
    if (newTodos.contains(todo)) {
      newTodos[newTodos.indexOf(todo)] = newTodo;
    }
    return newTodos;
  }
}
