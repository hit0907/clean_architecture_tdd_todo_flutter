import 'package:flutter/cupertino.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';

class TodoModel extends Todo {
  TodoModel({
    @required String text,
    @required bool completed,
  }) : super(text: text, completed: completed);

  factory TodoModel.fromJson(Map<String, dynamic> json) {
    return TodoModel(text: json['text'], completed: json['completed'] as bool);
  }

  Map<String, dynamic> toJson() {
    return {'text': text, 'completed': completed};
  }
}
