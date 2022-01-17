import 'package:get/get.dart';
import 'package:renest/app/modules/home/views/search_view.dart';

import '../modules/addTask/bindings/add_task_binding.dart';
import '../modules/addTask/views/add_task_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.home;

  static final routes = [
    GetPage(name: _Paths.search, page: () => SearchView()),
    GetPage(
      name: _Paths.home,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.addTask,
      page: () => AddTaskView(),
      binding: AddTaskBinding(),
    ),
  ];
}
