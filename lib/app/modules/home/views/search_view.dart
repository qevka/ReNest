import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/components/search_bar.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/app/modules/home/views/tasks.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

class SearchView extends GetView<HomeController> {
  static const Key searchKey = Key("searchKey");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: Get.width,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: Hero(
                          tag: "Search",
                          child: SearchBar(
                            searchKey: searchKey,
                            shouldFocus: true,
                            onChanged: controller.search,
                          )),
                    ),
                    TextButton(
                        onPressed: () {
                          controller.endSearch();
                          assert(controller.searching == false);
                          Get.back();
                        },
                        child: Text(
                          "Cancel",
                          style:
                              TextStyle(fontFamily: ReNestFont.avenirBook, color: RenestColor.taskTextColor, fontSize: 18),
                        ))
                  ],
                ),
              ),
            ),
            Expanded(
              child: Hero(
                child: TaskList(),
                tag: "Tasks",
              ),
            )
          ],
        ),
      ),
    );
  }
}
