import 'package:flutter/material.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/widgets/todo_item.dart';

class TodoList extends StatelessWidget {
  final List<Todo> _todos;

  TodoList(this._todos);

  @override
  Widget build(BuildContext context) {
    return _todos.length < 1
        ? _empty()
        : ListView.builder(
            padding: const EdgeInsets.all(10.0),
            itemBuilder: (BuildContext context, int index) {
              return TodoItem(_todos[index]);
            },
            itemCount: _todos.length,
          );
  }

  Widget _empty() {
    return Container(
        height: 50, child: Center(child: Text('Todo list is empty')));
  }
}
