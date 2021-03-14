import 'package:get_it/get_it.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/datasources/todo_data_source.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/datasources/todo_data_source_impl.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/data/repositories/todo_repository_impl.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/repositories/todo_repository.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/fetch_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/usecases/mark_complete_todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bottom_bar_bloc.dart';

import 'features/todo/domain/usecases/mark_incomplete_todo.dart';

final getIt = GetIt.instance;

void setup() {
  // Features
  getIt.registerFactory(() =>
      TodoBloc(fetch: getIt(), markComplete: getIt(), markInComplete: getIt()));
  getIt.registerFactory(() => TodoBottomBarBloc());

  // Use cases
  getIt.registerLazySingleton(() => FetchTodo(getIt()));
  getIt.registerLazySingleton(() => MarkCompleteTodo(getIt()));
  getIt.registerLazySingleton(() => MarkInCompleteTodo(getIt()));

  // Repository
  getIt.registerLazySingleton<TodoRepository>(
      () => TodoRepositoryImpl(dataSource: getIt()));

  // Data sources
  getIt.registerLazySingleton<TodoDataSource>(() => TodoDataSourceImpl());
}
