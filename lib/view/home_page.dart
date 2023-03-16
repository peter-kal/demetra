import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:yaru_widgets/yaru_widgets.dart';
import 'package:demetra/view/dialog_task-creation.dart';

class HomePage extends StatefulWidget {
  bool isCloseable = true;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Demetra'),
        ),
        body: Column(
          children: const [
            SizedBox(
              height: 5,
            ),
            DialogPage(),
            SizedBox(
              width: 1,
              height: 15,
            ),
          ],
        ));
  }
}
