import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/datasources/todo_data_source.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/models/todo_model.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:mockito/mockito.dart';

class MockTodoDataSource extends Mock implements TodoDataSource {}

void main() {
  TodoRepositoryImpl todoRepositoryImpl;
  MockTodoDataSource mockTodoDataSource;

  setUp(() {
    mockTodoDataSource = MockTodoDataSource();
    todoRepositoryImpl = TodoRepositoryImpl(dataSource: mockTodoDataSource);
  });

  final tCompletedTodo = TodoModel(text: 'Todo completed', completed: true);
  final tInCompletedTodo =
      TodoModel(text: 'Todo incompleted', completed: false);
  final tTodoList = [
    tCompletedTodo,
    tInCompletedTodo,
  ];

  test('should return todo list when the call to data source', () async {
    // arrange
    when(mockTodoDataSource.fetch()).thenAnswer((_) async => tTodoList);
    // act
    final result = await todoRepositoryImpl.fetch();
    // assert
    verify(mockTodoDataSource.fetch());
    expect(result, tTodoList);
  });

  test('should return todo completed after call to data source', () async {
    // arrange
    when(mockTodoDataSource.markCompleteTodo(tInCompletedTodo))
        .thenAnswer((_) async => tCompletedTodo);
    // act
    final result = await todoRepositoryImpl.markCompleteTodo(tInCompletedTodo);
    // assert
    verify(mockTodoDataSource.markCompleteTodo(tInCompletedTodo));
    expect(result, tCompletedTodo);
  });

  test('should return todo incompleted after call to data source', () async {
    // arrange
    when(mockTodoDataSource.markInCompleteTodo(tCompletedTodo))
        .thenAnswer((_) async => tInCompletedTodo);
    // act
    final result = await todoRepositoryImpl.markInCompleteTodo(tCompletedTodo);
    // assert
    verify(mockTodoDataSource.markInCompleteTodo(tCompletedTodo));
    expect(result, tInCompletedTodo);
  });
}
