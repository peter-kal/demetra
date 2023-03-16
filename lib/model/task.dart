import 'package:flutter/rendering.dart';

class Task {
  String? name;
  String? notes;

  Task({required this.name, required this.notes});

  Task.empty() : this(name: "", notes: "");

  factory Task.fromJson(Map<String, dynamic> json) =>
      Task(name: json['name'], notes: json['notes']);

  Map<String, dynamic> toJson() => {"name": name, "notes": notes};
}
