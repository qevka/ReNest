import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/add_task_controller.dart';

class AddTaskView extends GetView<AddTaskController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AddTaskView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'AddTaskView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
