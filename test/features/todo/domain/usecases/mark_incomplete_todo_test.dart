import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_incomplete_todo.dart';
import 'package:mockito/mockito.dart';

class MockTodoRepository extends Mock implements TodoRepository {}

void main() {
  MarkInCompleteTodo markInCompleteTodo;
  MockTodoRepository mockTodoRepository;

  setUp(() {
    mockTodoRepository = MockTodoRepository();
    markInCompleteTodo = MarkInCompleteTodo(mockTodoRepository);
  });

  test('should mark todo is incompleted from repository', () async {
    //Setup
    Todo todo = Todo(text: 'todo', completed: true);
    Todo todoInCompleted = Todo(text: 'todo', completed: false);

    when(mockTodoRepository.markInCompleteTodo(todo))
        .thenAnswer((_) async => todoInCompleted);

    // act
    final result = await markInCompleteTodo(todo);

    // assert
    expect(result.completed, false);
    // Verify method called
    verify(mockTodoRepository.markInCompleteTodo(todo));
    // Verify nothing more called
    verifyNoMoreInteractions(mockTodoRepository);
  });
}
