import 'package:flutter/material.dart';
import 'package:demetra/view/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:yaru/yaru.dart' as yaru;
import 'package:yaru/yaru.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('taskbox');

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
        debugShowCheckedModeBanner: false);
  }
}
