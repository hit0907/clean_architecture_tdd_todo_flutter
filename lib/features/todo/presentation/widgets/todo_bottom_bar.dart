import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:clean_architecture_tdd_todo_flutter/features/todo/presentation/blocs/bloc/todo_bottom_bar_bloc.dart';

class TodoBottomBar extends StatelessWidget {
  static int all = 0;
  static int completed = 1;
  static int incompleted = 2;

  @override
  Widget build(BuildContext context) {
    TodoBottomBarBloc bloc = BlocProvider.of<TodoBottomBarBloc>(context);
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'All',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_box),
          label: 'Completed',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.check_box_outline_blank),
          label: 'InCompleted',
        ),
      ],
      currentIndex: bloc.state.index,
      selectedItemColor: Colors.blue,
      onTap: (value) => _onItemTapped(bloc, value),
    );
  }

  _onItemTapped(TodoBottomBarBloc bloc, int value) {
    TodoBottomBarEvent event;
    if (value == completed) {
      event = TodoBottomBarEventCompleted();
    } else if (value == incompleted) {
      event = TodoBottomBarEventInCompleted();
    } else {
      event = TodoBottomBarEventAll();
    }
    bloc.add(event);
  }
}
