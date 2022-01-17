import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';

class HomeController extends GetxController {
  HomeController({this.testMode = false});

  final bool testMode;
  bool searching = false;
  RxList<Task> tasks = RxList.empty();
  RxList<Task> tasksHolder = RxList.empty();
  RxList<Task> get complete {
    return tasks.where((task) => task.done == true).toList().obs;
  }

  toggleDone(Task task) {
    tasks.firstWhere((t1) => t1.name == task.name).done = !task.done;
    tasks.refresh();
    complete.refresh();
  }

  addTask(Task task) {
    tasks.add(task);
    tasks.refresh();
  }

  endSearch() {
    searching = false;
    tasks.value = tasksHolder.toList();
  }

  startSearch() {
    searching = true;
    tasksHolder.value = tasks.toList();
  }

  /// Must call start and end search and the beginning and end of each earch
  search(String query) {
    assert(searching, true);
    tasks.value = tasksHolder.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  _loadTestData() async {
    final taskData = await rootBundle.loadString('assets/test_data/tasks.json');
    final jsonData = json.decode(taskData);
    for (var data in jsonData) {
      Task task = Task.fromJson(data);
      tasks.add(task);
    }
  }

  // _loadRealData() async {
  //   Load real data here.
  // }

  @override
  void onInit() async {
    super.onInit();
    // When actual data is available replace the second condition with _loadRealData.
    testMode ? await _loadTestData() : await _loadTestData();
  }
}
