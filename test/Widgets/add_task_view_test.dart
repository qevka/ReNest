import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/app/modules/home/views/add_task_view.dart';
import 'package:renest/app/modules/home/views/home_view.dart';

Widget testWidget({required Widget child}) {
  return GetMaterialApp(
    home: child,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final controller = HomeController(testMode: true);
  Get.put(controller);

  setupTests(WidgetTester tester) async {
    await tester.pumpWidget(testWidget(child: HomeView()));
    Get.to(() => AddTaskView());
    await tester.pumpAndSettle();
  }

  group("Add Task", () {
    testWidgets('Test Add', (WidgetTester tester) async {
      // setup testing env
      await setupTests(tester);
      // Load list of initial number of normal priority tasks
      int initialNormalPriorityTasks = controller.tasks.where((p0) => p0.priority == Priority.normal).length;
      // grab pointer to priority button
      final priorityButton = find.byKey(AddCell.normalPriorityKey).first;
      // grab pointer to add button
      final addButton = find.byKey(AddCell.addButtonKey).first;

      // Tap the add button then tap the priority button and check to see if it got added to the list.
      await tester.tap(addButton);
      await tester.pumpAndSettle();
      await tester.tap(priorityButton);
      expect(controller.tasks.where((p0) => p0.priority == Priority.normal).length, initialNormalPriorityTasks + 1);
    });
  });
}
