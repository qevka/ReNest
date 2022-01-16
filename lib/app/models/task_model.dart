import 'package:json_annotation/json_annotation.dart';

part 'task_model.g.dart';

@JsonSerializable()
class Task {
  String name;
  bool done;
  Priority priority;

  Task({required this.name, required this.done, required this.priority});

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);

  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

enum Priority {
  high,
  normal,
  low,
}
