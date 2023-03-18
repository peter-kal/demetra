import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class ToDoCard extends StatelessWidget {
  final String taskname = "";
  final bool taskStatus = true;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.black38, borderRadius: BorderRadius.circular(10)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          YaruCheckbox(
            value: taskStatus,
            onChanged: null,
            selectedColor: Colors.orange,
          ),
          Text(
            taskname,
            style: TextStyle(
              decoration:
                  taskStatus ? TextDecoration.lineThrough : TextDecoration.none,
            ),
          ),
          OutlinedButton(onPressed: null, child: const Text('Delete')),
        ],
      ),
    );
  }
}
