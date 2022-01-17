import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/app/modules/home/widgets/task_cell.dart';
import 'package:renest/styles/fonts.dart';

class TaskGroup extends GetView<HomeController> {
  TaskGroup({required this.cells, required this.name, required this.color, this.completedTasks = false});

  final bool completedTasks;
  final String name;
  final Color color;
  final List<TaskCell> cells;

  @override
  Widget build(BuildContext context) {
    print(completedTasks);
    return completedTasks
        ? Column(
            children: controller.complete.map((t) => TaskCell(task: t)).toList(),
          )
        : Material(
            child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Color.fromRGBO(50, 49, 92, .07), Color.fromRGBO(50, 49, 92, .05)])),
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(40, 20, 0, 10),
                      child: Text(
                        name.toUpperCase(),
                        style: TextStyle(
                            color: color, fontFamily: ReNestFont.avenirMedium, fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                    Column(
                      children: cells,
                    )
                  ],
                ),
              ),
            ),
          );
  }
}
