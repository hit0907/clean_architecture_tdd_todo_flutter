import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/domain/entities/todo.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bottom_bar_bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/widgets/todo_bottom_bar.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/widgets/todo_page_view_all.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/widgets/todo_page_view_completed.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/widgets/todo_page_view_incompleted.dart';
import 'package:clean_architecture_tdd_todo_flutter/injection_container.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  TodoBloc _todoBloc;
  TodoBottomBarBloc _todoBottomBarBloc;
  PageController _pageController = PageController();
  bool _pageViewAutoUpdated = false;

  @override
  void initState() {
    // Init and send fetch event
    _todoBloc = getIt<TodoBloc>()..add(TodoEventFetch());
    _todoBottomBarBloc = getIt<TodoBottomBarBloc>();
    _setUpBottomBarChanged();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<TodoBloc>(
            create: (BuildContext context) => _todoBloc,
          ),
          BlocProvider<TodoBottomBarBloc>(
            create: (BuildContext context) => _todoBottomBarBloc,
          ),
        ],
        child: BlocBuilder<TodoBottomBarBloc, TodoBottomBarState>(
          builder: (context, bottomNavState) {
            return BlocBuilder<TodoBloc, List<Todo>>(builder: (context, todos) {
              return Scaffold(
                  appBar: AppBar(
                    title: const Text('Todo App'),
                  ),
                  body: _buidPageView(_todoBloc.state),
                  bottomNavigationBar: TodoBottomBar());
            });
          },
        ));
  }

  @override
  dispose() {
    _todoBloc.close();
    _todoBottomBarBloc.close();
    super.dispose();
  }

  Widget _buidPageView(List<Todo> _todos) {
    return PageView(
      controller: _pageController,
      onPageChanged: _pageViewChanged,
      children: <Widget>[
        TodoPageViewAll(_todos),
        TodoPageViewCompleted(_todos),
        TodoPageViewInCompleted(_todos)
      ],
    );
  }

  _pageViewChanged(int value) {
    if (!_pageViewAutoUpdated) {
      _pageViewAutoUpdated = _todoBottomBarBloc.state.index == value;
      return;
    }
    TodoBottomBarEvent event;
    if (value == TodoBottomBar.completed) {
      event = TodoBottomBarEventCompleted();
    } else if (value == TodoBottomBar.incompleted) {
      event = TodoBottomBarEventInCompleted();
    } else {
      event = TodoBottomBarEventAll();
    }
    // Focus correct bottom bar
    _todoBottomBarBloc.add(event);
  }

  _setUpBottomBarChanged() {
    // Active page view by bottom bar index
    _todoBottomBarBloc.listen((TodoBottomBarState state) {
      _pageViewAutoUpdated = false;
      _pageController.animateToPage(state.index,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }
}
