import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/components/task_cell.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/app/modules/home/views/home_view.dart';
import 'package:renest/app/modules/home/views/tasks.dart';

Widget testWidget({required Widget child}) {
  return MaterialApp(
    home: child,
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  final controller = HomeController(testMode: true);
  Get.put(controller);

  setupTests(WidgetTester tester) async {
    await tester.pumpWidget(testWidget(child: HomeView()));
  }

  group("HomeView widget tests", () {
    testWidgets('Add Task', (WidgetTester tester) async {
      await setupTests(tester);
      // Create the Finders.
      final titleFinder = find.text('ReNest');
      expect(titleFinder, findsOneWidget);
      // Enter text code...
      await tester.pumpAndSettle();

      // test adding task to see if it completes.
      await tester.tap(find.byKey(TaskCell.taskKeyIncomplete, skipOffstage: false).first);
      await tester.pumpAndSettle();

      expect(controller.complete.length, 3);
    });

    testWidgets('Remove Task', (WidgetTester tester) async {
      await setupTests(tester);
      // Scroll down to completed tasks
      await tester.dragUntilVisible(
        find.byKey(TaskCell.taskKeyComplete, skipOffstage: false).first,
        find.byType(TaskList),
        const Offset(0, -250),
      );
      await tester.pump();

      // test tap uncompleted a task.
      await tester.tap(find.byKey(TaskCell.taskKeyComplete, skipOffstage: false).first);
      await tester.pumpAndSettle();

      expect(controller.complete.length, 2);
    });

    testWidgets('Test Completion Page', (WidgetTester tester) async {
      await setupTests(tester);
      await tester.tap(find.text("Completed"));
      await tester.pumpAndSettle();
      var findText = find.text("Find a contractor");
      expect(findText, findsOneWidget);
    });
  });
}
