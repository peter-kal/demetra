import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:demetra/model/task.dart';

class TaskService {
  TaskService({required this.uri});

  final String uri;

  Future<List<Task>> getTasks() async {
    final response = await http.get(uri.http(uri, 'tasks'));

    if (response.statusCode == 200) {
      var usersJson = jsonDecode(response.body.toString()) as List;
      return usersJson.map((json) => Task.fromJson(json)).toList();
    } else {
      throw Exception(response.statusCode.toString() + ': ' + response.body);
    }
  }

  Future saveTask(Task task) async {
    for (var aTask in await getTasks()) {
      if (aTask.name == task.name) {
        await updateTask(task);
        return;
      }
    }
    await addTask(task);
  }

  Future<http.Response> addTask(Task task) async {
    return await http.post(Uri.http(uri, 'tasks'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(task.toJson()));
  }

  Future updateTask(Task task) async {
    return await http.put(Uri.http(uri, 'tasks/${task.name}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(task.toJson()));
  }

  Future removeTask(Task task) async {
    await http.delete((Uri.http(uri, 'tasks/${task.name}')));
  }
}
