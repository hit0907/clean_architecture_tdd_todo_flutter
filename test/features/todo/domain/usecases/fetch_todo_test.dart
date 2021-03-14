import 'package:clean_architecture_tdd_todo_flutter/core/usecases/usecase.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/fetch_todo.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  FetchTodo fetchTodo;
  MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    fetchTodo = FetchTodo(mockTodoRepository);
  });

  test('should return todo list from repository', () async {
    //Setup
    List<Todo> fetchedTodo = [
      Todo(text: 'Init tech challenge project', completed: true),
      Todo(text: 'Create 3 layers for todo feature', completed: true),
      Todo(text: 'Write Todo Entity, Repository', completed: true),
      Todo(text: 'Write first test apply TDD', completed: false),
    ];

    //Telling the Mock Repo how to behave
    when(mockTodoRepository.fetch()).thenAnswer((_) async => fetchedTodo);

    // act
    final result = await fetchTodo(NoParams());

    // assert
    expect(result, fetchedTodo);
    // Verify method called
    verify(mockTodoRepository.fetch());
    // Verify nothing more called
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
