import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/completed_controller.dart';

class CompletedView extends GetView<CompletedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CompletedView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CompletedView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
