import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/fetch_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_complete_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_incomplete_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bloc.dart';
import 'package:mockito/mockito.dart';

class MockFetchTodo extends Mock implements FetchTodo {}

class MockMarkCompleteTodo extends Mock implements MarkCompleteTodo {}

class MockMarkInCompleteTodo extends Mock implements MarkInCompleteTodo {}

void main() {
  TodoBloc todoBloc;
  MockFetchTodo mockFetchTodo;
  MockMarkCompleteTodo mockMarkCompleteTodo;
  MockMarkInCompleteTodo mockMarkInCompleteTodo;

  setUp(() {
    mockFetchTodo = MockFetchTodo();
    mockMarkCompleteTodo = MockMarkCompleteTodo();
    mockMarkInCompleteTodo = MockMarkInCompleteTodo();
    todoBloc = TodoBloc(
        fetch: mockFetchTodo,
        markComplete: mockMarkCompleteTodo,
        markInComplete: mockMarkInCompleteTodo);
  });

  final todoCompleted = Todo(text: 'Todo item', completed: true);
  final todoInCompleted = Todo(text: 'Todo item', completed: false);
  final List<Todo> todos = [todoCompleted, todoInCompleted];

  test('Init state should be empty list', () {
    expect(todoBloc.state, []);
  });

  test('should emit State is todo list when send fetch event', () async {
    when(mockFetchTodo(any)).thenAnswer((_) async => todos);

    List expectedStates = [todos];

    //result
    expectLater(todoBloc, emitsInOrder(expectedStates));

    //act
    todoBloc.add(TodoEventFetch());
  });

  test('Send TodoEventCompleted and see if it emits correct', () async {
    when(mockFetchTodo(any)).thenAnswer((_) async => [todoInCompleted]);
    when(mockMarkCompleteTodo(todoInCompleted))
        .thenAnswer((_) async => todoCompleted);

    List expectedStates = [
      [todoInCompleted],
      [todoCompleted]
    ];

    //result
    expectLater(todoBloc, emitsInOrder(expectedStates));

    //act
    todoBloc.add(TodoEventFetch());
    todoBloc.add(TodoEventCompleted(todoInCompleted));
  });

  test('Send TodoEventInCompleted and see if it emits correct', () async {
    when(mockFetchTodo(any)).thenAnswer((_) async => [todoCompleted]);
    when(mockMarkInCompleteTodo(todoCompleted))
        .thenAnswer((_) async => todoInCompleted);

    List expectedStates = [
      [todoCompleted],
      [todoInCompleted]
    ];

    //result
    expectLater(todoBloc, emitsInOrder(expectedStates));

    // //act
    todoBloc.add(TodoEventFetch());
    todoBloc.add(TodoEventInCompleted(todoCompleted));
  });
}
