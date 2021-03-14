import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bottom_bar_bloc.dart';

void main() {
  TodoBottomBarBloc bloc;

  setUp(() {
    bloc = TodoBottomBarBloc();
  });

  test('Init state should be all', () {
    expect(bloc.state, TodoBottomBarStateAll());
  });

  test('should emits state in correct order', () {
    var expectedStates = [
      TodoBottomBarStateAll(),
      TodoBottomBarStateCompleted(),
      TodoBottomBarStateInCompleted()
    ];

    expectLater(bloc, emitsInOrder(expectedStates));

    bloc.add(TodoBottomBarEventAll());
    bloc.add(TodoBottomBarEventCompleted());
    bloc.add(TodoBottomBarEventInCompleted());
  });
}
