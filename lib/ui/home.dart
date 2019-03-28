import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasks/models/task.dart';
import 'package:tasks/providers/task.dart';
import 'package:tasks/ui/partials/mini_task.dart';
import 'package:tasks/ui/partials/paginator.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final StreamController<int> _paginationStream = StreamController<int>();
  final TaskProvider _provider = TaskProvider();

  @override
  void dispose() {
    _paginationStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder<List<TaskModel>>(
          initialData: [],
          future: this._provider.getTasks(),
          builder: (BuildContext context, AsyncSnapshot<List<TaskModel>> tasksSnap) {
            return Padding(
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
                                fontFamily: 'Lora',
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
                          itemCount: tasksSnap.data.length,
                          onPageChanged: this._paginationStream.sink.add,
                          itemBuilder: (_, int index) => MiniTaskCard(tasksSnap.data[index]),
                        ),
                      ),
                      SizedBox(height: 20),
                      StreamBuilder<int>(
                        initialData: 0,
                        stream: this._paginationStream.stream,
                        builder: (_, AsyncSnapshot<int> pageSnap) {
                          return Paginator(
                            totalPages: tasksSnap.data.length,
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
            );
          }
        ),
      ),
    );
  }
}