import 'package:flutter/material.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/pages/todo_page.dart';
import 'injection_container.dart' as di;
import 'bloc_observer.dart' as bloc;

void main() {
  // Bloc event loging
  bloc.traceEnable();

  // Setup di
  di.setup();

  // Start app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoPage(),
    );
  }
}
