part of 'todo_bottom_bar_bloc.dart';

abstract class TodoBottomBarState extends Equatable {
  final int index;

  TodoBottomBarState(this.index);

  @override
  List<Object> get props => [index];
}

class TodoBottomBarStateAll extends TodoBottomBarState {
  TodoBottomBarStateAll() : super(0);
}

class TodoBottomBarStateCompleted extends TodoBottomBarState {
  TodoBottomBarStateCompleted() : super(1);
}

class TodoBottomBarStateInCompleted extends TodoBottomBarState {
  TodoBottomBarStateInCompleted() : super(2);
}
