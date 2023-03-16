import 'package:flutter/material.dart';
import 'package:demetra/view/home_page.dart';
import 'package:yaru/yaru.dart' as yaru;
//import 'package:window_manager/window_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demetra',
      theme: yaru.yaruLight,
      darkTheme: yaru.yaruDark,
      home: HomePage(),
    );
  }
}
