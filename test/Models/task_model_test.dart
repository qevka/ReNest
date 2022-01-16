import 'dart:convert';
import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:renest/app/models/task_model.dart';

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
