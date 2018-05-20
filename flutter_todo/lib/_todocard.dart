import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final String task;
  final bool completed;
  final bool show;

  final pressCheck;
  final pressClosed;

  TodoCard({this.task, this.completed = false, this.show = true, this.pressCheck, this.pressClosed});

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new Card(
        child: new Padding(
          padding: const EdgeInsets.all(12.0),
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Expanded(
                  child: new Text(
                    task,
                    style: new TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 20.0
                    ),
                  )
              ),
              new Padding(
                padding: const EdgeInsets.only(right: 8.5),
                child: new IconButton(icon: new Icon(Icons.close, color: Colors.red,), onPressed: pressClosed,),
              ),
              new Container(
                height: 50.0,
                width: 2.0,
                color: Colors.grey,
              ),
              new Padding(
                padding: const EdgeInsets.only(left: 8.5),
                child: new IconButton(icon: new Icon(Icons.check, color: Colors.green), onPressed: pressCheck,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
