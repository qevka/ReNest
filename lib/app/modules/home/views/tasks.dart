import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/models/task_model.dart' as m;
import 'package:renest/app/modules/home/components/task_cell.dart';
import 'package:renest/app/modules/home/components/task_group.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';

class TaskList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // group tasks by priority
      final groups = {m.Priority.high, m.Priority.normal, m.Priority.low};
      List<TaskGroup> taskGroup = groups.map((e) {
        var tasks = controller.tasks.where((t) => t.priority == e && t.done == false).toList();
        return TaskGroup(cells: tasks.map((ts) => TaskCell(task: ts)).toList(), name: e.stringValue, color: e.color);
      }).toList();
      taskGroup.add(TaskGroup(
        cells: [],
        name: "Completed",
        color: Colors.transparent,
        completedTasks: true,
      ));
      // group completed tasks.
      return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) => taskGroup[index],
        itemCount: taskGroup.length,
      );
    });
  }
}
