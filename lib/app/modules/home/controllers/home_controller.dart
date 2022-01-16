import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';

class HomeController extends GetxController {
  List<Task> tasks = RxList.empty();
  List<Task> searchList = RxList.empty();

  //TODO: Implement HomeController

  final count = 0.obs;

  List<Task> search(String query) {
    return tasks.where((element) => element.name.toLowerCase().contains(query.toLowerCase())).toList();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
