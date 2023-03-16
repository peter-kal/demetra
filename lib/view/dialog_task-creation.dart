import 'package:flutter/material.dart';
import 'package:yaru_widgets/yaru_widgets.dart';

class DialogPage extends StatefulWidget {
  const DialogPage({super.key});

  @override
  State<DialogPage> createState() => _DialogPageState();
}

class _DialogPageState extends State<DialogPage> {
  
  @override
  Widget build(BuildContext context) {
  return  Center(
              child: ElevatedButton(
                  onPressed: () => showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      
                      titlePadding: EdgeInsets.zero,
                      title: YaruDialogTitleBar(
                        leading: const Center(
                          child: SizedBox.square(
                            dimension: 40,
                        
                          ),
                        ),
                        title: const Text('Create A Task'),
                        
                      ),
                      content: SizedBox(
                        height: 100,
                        child: YaruBanner.tile(
                          surfaceTintColor: Colors.pink,
                          title: Text(
                            'he'
                                                   ),
                       
                        ),
                      ),
                    );
                  },
                ),
                  child: const Text('+ Add a task')),
            );
   
   }
   }
