import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/ui/partials/mini_task.dart';
import 'package:tasks/ui/partials/paginator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final StreamController<int> _paginationStream = StreamController<int>();
  final List<Task> _tasks = [
    Task(),
  ];

  @override
  void dispose() {
    _paginationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(bottom: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'My Tasks',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            height: 0.8,
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'You have 5 tasks today.',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/images/user.jpg'),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 2,
                    child: PageView.builder(
                      itemCount: this._tasks.length,
                      itemBuilder: (_, int index) => MiniTaskCard(this._tasks[index]),
                    ),
                  ),
                  SizedBox(height: 20),
                  StreamBuilder<int>(
                    stream: this._paginationStream.stream,
                    builder: (_, AsyncSnapshot<int> pageSnap) {
                      return Paginator(
                        totalPages: this._tasks.length,
                        activePage: pageSnap.data
                      );
                    }
                  ),
                ],
              ),
              SizedBox(height: 10),
              FloatingActionButton(
                backgroundColor: Colors.white,
                onPressed: () {},
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}