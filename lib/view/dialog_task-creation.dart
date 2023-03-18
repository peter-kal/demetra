import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  TextEditingController _controller = TextEditingController();
  String title = "";
  late String text;

  void SaveButton() {
    final _mybox2 = Hive.box('taskbox');
    _mybox2.put('name', title);
    print(_mybox2.get('name'));
    _controller.clear();
    Navigator.maybePop(context);
  }

  void setText() {
    setState(() {
      text = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () => showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                      titlePadding: EdgeInsets.zero,
                      title: const YaruDialogTitleBar(
                        leading: Center(
                          child: SizedBox(
                            width: 490,
                            height: 460,
                          ),
                        ),
                        title: Text('Create A Task'),
                      ),
                      content: Center(
                          child: Column(
                        children: [
                          const Text('Name:'),
                          TextField(
                            decoration: const InputDecoration(
                              hintText: 'Type the name of the task',
                            ),
                            maxLength: 250,
                            maxLines: 4,
                            minLines: 1,
                            controller: _controller,
                            onChanged: (value) => title = value,
                          ),
                          const SizedBox(width: 1, height: 40),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                    onPressed: () =>
                                        Navigator.maybePop(context),
                                    child: const Text('Cancel')),
                                const SizedBox(
                                  //add space between the buttons
                                  width: 5,
                                  height: 2,
                                ),
                                ElevatedButton(
                                    onPressed: () => SaveButton(),
                                    child: Text(' Save ')),
                              ],
                            ),
                          ),
                        ],
                      )));
                },
              ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(Icons.add),
              const SizedBox(
                width: 5,
              ),
              const Text('New Task'),
            ],
          )),
    );
  }
}
