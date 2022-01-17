import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

class TaskCell extends GetView<HomeController> {
  TaskCell({required this.task});

  final Task task;

  Widget completeCell() {
    return Material(
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
              child: Row(
                children: [
                  GestureDetector(
                    child: Icon(
                      FontAwesomeIcons.checkCircle,
                      color: Colors.black26,
                    ),
                    onTap: () {
                      controller.toggleDone(task);
                    },
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    task.name,
                    style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.black26),
                  )
                ],
              ),
            ),
            Container(
              color: Colors.black12,
              height: 1,
              width: Get.width - 40,
            )
          ],
        ),
      ),
    );
  }

  Widget inCompleteCell() {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          GestureDetector(
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Icon(
                FontAwesomeIcons.circle,
                color: Colors.black54,
              ),
            ),
            onTap: () {
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
                color: task.done ? RenestColor.taskTextColorDone : RenestColor.taskTextColor,
                fontSize: 18,
                fontWeight: FontWeight.normal),
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
