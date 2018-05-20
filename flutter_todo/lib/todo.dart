import 'package:flutter/material.dart';

import 'package:flutter_todo/_todocard.dart';
import 'package:flutter_todo/statsview.dart';
import 'package:flutter_todo/task.dart';
import 'package:flutter_todo/tasklist.dart';

class Todo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Todo App',
      home: new TabBarControls(),
      theme: new ThemeData(fontFamily: 'Montserrat'),
    );
  }
}

class TabBarControls extends StatefulWidget {
  @override
  _TabBarControlsState createState() => new _TabBarControlsState();
}

class _TabBarControlsState extends State<TabBarControls> with SingleTickerProviderStateMixin {

  TabController _tabControls;

  List<Task> tasks = [new Task(task: 'Example1',), new Task(task: 'Example2',)];
  List<Task> completed = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabControls = new TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabControls.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListState(
      tasks: tasks,
      completed: completed,
      child: new Scaffold(
          appBar: new AppBar(
            title: new Text(
              'ToDo',
            ),
            bottom: new TabBar(
                controller: _tabControls,
                tabs: <Tab>[
              new Tab(
                icon: new Icon(Icons.favorite),
                text: 'Tasks',
              ),
              new Tab(
                icon: new Icon(Icons.contact_mail),
                text: 'Stats',
              )
            ]),
          ),
          body: new SafeArea(
            child: new TabBarView(
                controller: _tabControls,
                children: <Widget>[
                  new TodoListView(),
                  new StatsView()
                ]),
          )
      ),
    );
  }
}

class ListState extends InheritedWidget {
  ListState ({
    Key key,
    this.tasks,
    this.completed,
    Widget child
  }) : super(key: key, child: child);

  final List<Task> tasks;
  final List<Task> completed;

  @override
  bool updateShouldNotify(ListState oldWidget) {
    return tasks != oldWidget.tasks || completed != oldWidget.completed;
  }

  static ListState of (BuildContext context) {
    return context.inheritFromWidgetOfExactType(ListState);
  }
}