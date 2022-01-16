import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/models/task_model.dart' as m;
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

class TaskList extends GetView<HomeController> {
  final groups = {m.Priority.high, m.Priority.normal, m.Priority.low};

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      // group tasks by priority
      List<TaskGroup> taskGroup = groups.map((e) {
        var tasks = controller.tasks.where((t) => t.priority == e && t.done == false).toList();
        return TaskGroup(cells: tasks.map((ts) => TaskCell(task: ts)).toList(), name: e.stringValue, color: e.color);
      }).toList();
      taskGroup.add(TaskGroup(
        cells: controller.complete.map((t) => TaskCell(task: t)).toList(),
        name: "",
        color: Colors.transparent,
      ));
      // group completed tasks.
      print(taskGroup.length);
      return ListView.builder(
        itemBuilder: (context, index) => taskGroup[index],
        itemCount: groups.length,
      );
    });
  }
}

class TaskCell extends GetView<HomeController> {
  TaskCell({required this.task});

  final Task task;

  Widget completeCell() {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Icon(Icons.check_circle),
              Text(
                task.name,
                style: TextStyle(decoration: TextDecoration.lineThrough),
              )
            ],
          ),
          Container(
            color: RenestColor.textFieldHintText,
            height: 1,
            width: Get.width - 80,
          )
        ],
      ),
    );
  }

  Widget inCompleteCell() {
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        children: [
          IconButton(
            splashColor: Colors.transparent,
            icon: Icon(
              FontAwesomeIcons.circle,
              color: Colors.black54,
            ),
            onPressed: () {
              controller.toggleDone(task);
            },
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            task.name,
            style: TextStyle(
                fontFamily: ReNestFont.avenirBook,
                decoration: task.done ? TextDecoration.lineThrough : TextDecoration.none,
                color: task.done ? RenestColor.taskTextColorDone : RenestColor.taskTextColor),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.fromLTRB(10.0, 5, 10, 5), child: task.done ? completeCell() : inCompleteCell());
  }
}

class TaskGroup extends GetView<HomeController> {
  TaskGroup({required this.cells, required this.name, required this.color});

  final String name;
  final Color color;
  final List<TaskCell> cells;

  @override
  Widget build(BuildContext context) {
    return cells.isNotEmpty
        ? Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color.fromRGBO(50, 49, 92, .05), Color.fromRGBO(50, 49, 92, 0)])),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(40, 20, 0, 10),
                    child: Text(
                      name.toUpperCase(),
                      style: TextStyle(color: color, fontFamily: ReNestFont.avenirMedium),
                    ),
                  ),
                  Column(
                    children: cells,
                  )
                ],
              ),
            ),
          )
        : Container();
  }
}
