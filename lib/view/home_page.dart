import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:demetra/view/dialog_task-creation.dart';

import 'task_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _mybox = Hive.box('taskbox');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // The plan is to switch to YaruWindowTitleBar
          //but can't find a way to remove the gtk_header_bar
          title: const Text('Demetra'),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            DialogPage(),
            SizedBox(
              width: 1,
              height: 15,
            ),
            ToDoCard(),
          ],
        ));
  }
}
