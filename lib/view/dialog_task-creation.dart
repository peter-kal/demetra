import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';
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
                            decoration: const InputDecoration(
                              labelText: 'Notes',
                            ),
                            maxLines: 8,
                            minLines: 8,
                            maxLength: 500,
                            scrollPadding: EdgeInsets.all(500.0),
                            controller: _controller2,
                            onSubmitted: ((description) => String),
                          ),
                          const SizedBox(width: 1, height: 40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                  onPressed: () => Navigator.maybePop(context),
                                  child: const Text('Cancel')),
                              const SizedBox(
                                //add space between the buttons
                                width: 5,
                                height: 2,
                              ),
                              const ElevatedButton(
                                  onPressed: null, child: Text(' Save ')),
                            ],
                          ),
                        ],
                      )));
                },
              ),
          child: const Text(' + Add a task ')),
    );
  }
}
