import 'dart:convert';
import 'dart:io';

import 'package:ReNest/app/models/task_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("fromJson/toJson", () async {
    final taskData = File('assets/test_data/tasks.json');
    final jsonData = jsonDecode(await taskData.readAsString());
    for (var data in jsonData) {
      Task task = Task.fromJson(data);
      expect(task.toJson(), data);
    }
  });
}
