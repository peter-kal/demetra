import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:injector/injector.dart';
import 'package:demetra/model/task.dart';
import 'package:demetra/model/task_service.dart';
import 'package:demetra/view/task_card.dart';
import 'package:demetra/view/dialog_task-creation.dart';
import 'package:demetra/view/home_page.dart';

class ListTheTasks extends StatefulWidget {
  @override
  _ListTheTaskState createState() => _ListTheTaskState();
}

class _ListTheTaskState extends State<ListTheTasks> {
  
  final _taskService = Injector.appInstance.get<TaskService>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Scrollbar(child: FutureBuilder(
              builder: (context, AsyncSnapshot<List<Task>> snapShot) {
            if (snapShot.hasData) {
             return ListView(
                      children: snapShot.data!
                          .map((task) => TaskCard(
                              task: task,
                              onDelete: () {
                                _taskService
                                    .removeTask(task)
                                    .then((value) => setState(() {
                                          _showSnackBar(
                                              'Deleted task: ' + task.name);
                                        }))
            ));
                          
                        ,
            };
          })),
        ],
      ),
    );
  }
}
