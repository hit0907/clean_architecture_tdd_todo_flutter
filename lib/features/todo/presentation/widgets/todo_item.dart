import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bloc.dart';

class TodoItem extends StatelessWidget {
  final Todo _todo;

  TodoItem(this._todo);

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
      title: Text(_todo.text),
      onChanged: (bool value) {
        TodoEvent event;
        if (value) {
          event = TodoEventCompleted(_todo);
        } else {
          event = TodoEventInCompleted(_todo);
        }
        BlocProvider.of<TodoBloc>(context).add(event);
      },
      value: _todo.completed,
    );
  }
}
