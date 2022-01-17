import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/app/modules/home/widgets/task_cell.dart';

class CompletedTaskList extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
          shrinkWrap: true,
          itemBuilder: (context, index) {
            if (controller.tasks.isNotEmpty) {
              return TaskCell(task: controller.complete[index]);
            } else {
              return Container(
                height: 1,
                width: 1,
              );
            }
          },
          itemCount: controller.complete.length,
        ));
  }
}
