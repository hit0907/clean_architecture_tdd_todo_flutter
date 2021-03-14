import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_complete_todo.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MarkCompleteTodo markCompleteTodo;
  MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    markCompleteTodo = MarkCompleteTodo(mockTodoRepository);
  });

  test('should mark todo is completed from repository', () async {
    //Setup
    Todo todo = Todo(text: 'todo', completed: false);
    Todo todoCompleted = Todo(text: 'todo', completed: true);

    when(mockTodoRepository.markCompleteTodo(todo))
        .thenAnswer((_) async => todoCompleted);

    // act
    final result = await markCompleteTodo(todo);

    // assert
    expect(result.completed, true);
    // Verify method called
    verify(mockTodoRepository.markCompleteTodo(todo));
    // Verify nothing more called
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
