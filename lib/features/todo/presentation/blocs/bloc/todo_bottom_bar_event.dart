part of 'todo_bottom_bar_bloc.dart';

abstract class TodoBottomBarEvent extends Equatable {
  const TodoBottomBarEvent();

  @override
  List<Object> get props => [];
}

class TodoBottomBarEventAll extends TodoBottomBarEvent {}

class TodoBottomBarEventCompleted extends TodoBottomBarEvent {}

class TodoBottomBarEventInCompleted extends TodoBottomBarEvent {}
