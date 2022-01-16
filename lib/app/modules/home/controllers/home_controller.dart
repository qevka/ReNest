import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';

class HomeController extends GetxController {
  RxList<Task> tasks = RxList.empty();
  RxList<Task> get complete {
    return tasks.where((task) => task.done == true).toList().obs;
  }

  //TODO: Implement HomeController

  final count = 0.obs;

  toggleDone(Task task) {
    tasks.firstWhere((t1) => t1.name == task.name).done = !task.done;
    tasks.refresh();
    complete.refresh();
  }

  List<Task> search(String query) {
    return tasks.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  void onInit() async {
    super.onInit();
    final taskData = await rootBundle.loadString('assets/test_data/tasks.json');
    final jsonData = json.decode(taskData);
    for (var data in jsonData) {
      Task task = Task.fromJson(data);
      tasks.add(task);
    }
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
