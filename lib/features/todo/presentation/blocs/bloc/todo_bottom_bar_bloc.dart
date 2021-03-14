import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'todo_bottom_bar_event.dart';
part 'todo_bottom_bar_state.dart';

class TodoBottomBarBloc extends Bloc<TodoBottomBarEvent, TodoBottomBarState> {
  TodoBottomBarBloc() : super(TodoBottomBarStateAll());

  @override
  Stream<TodoBottomBarState> mapEventToState(
    TodoBottomBarEvent event,
  ) async* {
    if (event is TodoBottomBarEventAll) {
      yield TodoBottomBarStateAll();
    } else if (event is TodoBottomBarEventCompleted) {
      yield TodoBottomBarStateCompleted();
    } else if (event is TodoBottomBarEventInCompleted) {
      yield TodoBottomBarStateInCompleted();
    }
  }
}
