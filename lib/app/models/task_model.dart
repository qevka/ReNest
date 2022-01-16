import 'dart:ui';

import 'package:json_annotation/json_annotation.dart';
import 'package:renest/styles/colors.dart';

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

extension PriorityExt on Priority {
  String get stringValue {
    switch (this) {
      case Priority.high:
        return "HIGH PRIORITY";
      case Priority.normal:
        return "NORMAL PRIORITY";
      case Priority.low:
        return "LOW PRIORITY";
    }
  }

  Color get color {
    switch (this) {
      case Priority.high:
        return RenestColor.highPriority;
      case Priority.normal:
        return RenestColor.normalPriority;
      case Priority.low:
        return RenestColor.lowPriority;
    }
  }
}
