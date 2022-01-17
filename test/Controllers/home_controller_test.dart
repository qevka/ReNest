import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';

void main() {
  /// You can test the controller without the lifecycle,
  /// but it's not recommended unless you're not using
  ///  GetX dependency injection
  TestWidgetsFlutterBinding.ensureInitialized();
  final testTask = Task(done: false, name: "testTask", priority: Priority.high);
  final controller = HomeController(testMode: true);
  Get.put(controller);
  group('test Functions', () {
    test("add Task", () {
      controller.addTask(testTask);
      expect(1, controller.tasks.where((p0) => p0.name == "testTask").length);
    });
    test("Test Searching", () {
      ///test search for "re"
      controller.startSearch();
      controller.search("re");
      expect(controller.tasks.length, 2);

      /// Test deleting all text
      controller.search("");
      expect(controller.tasks.length, 11);

      /// Test search for caps RE.
      controller.search("RE");
      expect(controller.tasks.length, 2);

      /// Test that task list is returned to normal
      controller.endSearch();
      expect(controller.tasks.length, 11);
      Get.delete<HomeController>();
    });
  });
}
