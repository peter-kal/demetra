import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  late TextEditingController _controller;
  late TextEditingController _controller2;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _controller2 = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
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
                            width: 300,
                            height: 100,
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
                              labelText: 'Name',
                            ),
                            maxLength: 50,
                            maxLines: 2,
                            minLines: 1,
                            controller: _controller,
                            onSubmitted: ((title) => String),
                          ),
                          const Text('Details:'),
                          TextField(
                            decoration: InputDecoration(
                              labelText: 'Description',
                            ),
                            maxLines: 8,
                            minLines: 1,
                            maxLength: 200,
                            controller: _controller2,
                            onSubmitted: ((description) => String),
                          ),
                        ],
                      )));
                },
              ),
          child: const Text('+ Add a task')),
    );
  }
}
