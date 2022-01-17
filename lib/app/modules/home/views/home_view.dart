import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:renest/app/modules/home/views/completed.dart';
import 'package:renest/app/modules/home/views/search_view.dart';
import 'package:renest/app/modules/home/views/tasks.dart';
import 'package:renest/app/modules/home/widgets/search_bar.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('ReNest'),
          centerTitle: true,
          leading: IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
          bottom: PreferredSize(
            preferredSize: Size(Get.width, 120),
            child: Container(
              width: Get.width,
              height: 110,
              color: Colors.white,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 20),
                    child: Hero(
                      tag: "Search",
                      child: SearchBar(
                        onTap: () {
                          Get.to(() => SearchView(), transition: Transition.topLevel);
                        },
                        onChanged: (val) {},
                      ),
                    ),
                  ),
                  TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(-12),
                    indicatorColor: Colors.black,
                    tabs: [Text("Tasks"), Text("Completed")],
                    unselectedLabelColor: RenestColor.textFieldHintText,
                    unselectedLabelStyle:
                        TextStyle(fontFamily: ReNestFont.avenirBlack, fontWeight: FontWeight.bold, fontSize: 19),
                    labelStyle: TextStyle(fontFamily: ReNestFont.avenirBlack, fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: [
            Hero(
              child: TaskList(),
              tag: "Tasks",
            ),
            CompletedTaskList(),
          ],
        ),
      ),
    );
  }
}
