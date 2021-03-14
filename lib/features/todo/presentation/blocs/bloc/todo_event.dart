part of 'todo_bloc.dart';

abstract class TodoEvent {}

class TodoEventFetch extends TodoEvent {}

class TodoEventCompleted extends TodoEvent {
  final Todo todo;

  TodoEventCompleted(this.todo);
}

class TodoEventInCompleted extends TodoEvent {
  final Todo todo;

  TodoEventInCompleted(this.todo);
}
