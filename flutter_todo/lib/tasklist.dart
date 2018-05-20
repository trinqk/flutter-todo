import 'package:flutter/material.dart';
import 'package:flutter_todo/_todocard.dart';

import 'package:flutter_todo/todo.dart';

class TodoListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _list = ListState.of(context);

    return new ListView.builder(
        itemCount: _list.tasks.length,
        itemBuilder: (BuildContext context, int index) {
          return new TodoCard(
            task: _list.tasks[index].task,
            pressCheck: () {
              print('Working');
              _list.completed.add(_list.tasks[index]);
              _list.tasks.removeAt(index);
            },
            pressClosed: () {
              _list.tasks.removeAt(index);
            },
          );
        }
        );
  }
}
