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
      controller.startSearch();
      controller.search("re");
      expect(2, controller.tasks.length);
      controller.search("");
      expect(11, controller.tasks.length);
    });
  });
  Get.delete<HomeController>();
}
