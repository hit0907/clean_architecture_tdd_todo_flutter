import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

class Todo extends Equatable {
  final String text;
  final bool completed;

  Todo({
    @required this.text,
    @required this.completed,
  });

  @override
  List<Object> get props => [text, completed];
}
