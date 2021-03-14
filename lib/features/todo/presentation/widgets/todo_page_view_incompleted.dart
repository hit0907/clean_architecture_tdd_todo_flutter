import 'package:flutter/material.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/widgets/todo_list.dart';

class TodoPageViewInCompleted extends StatelessWidget {
  final List<Todo> _todos;

  TodoPageViewInCompleted(this._todos);

  @override
  Widget build(BuildContext context) {
    return TodoList(_todos.where((element) => !element.completed).toList());
  }
}
