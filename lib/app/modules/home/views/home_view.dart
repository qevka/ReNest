import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/widgets/search_bar.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ReNest'),
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.sort)),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.add))],
      ),
      body: Column(children: [
        Container(
          width: Get.width,
          height: 120,
          color: Colors.white,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SearchBar(
                  onChanged: print,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40, 10, 40, 10),
                child: DefaultTabController(
                  initialIndex: 1,
                  length: 2,
                  child: TabBar(
                    indicatorSize: TabBarIndicatorSize.label,
                    indicatorPadding: EdgeInsets.all(-16),
                    indicatorColor: Colors.black,
                    tabs: [Text("Tasks"), Text("Completed")],
                    unselectedLabelColor: ReNestColor.textFieldHintText,
                    unselectedLabelStyle:
                        TextStyle(fontFamily: ReNestFont.avenir, fontWeight: FontWeight.bold, fontSize: 19),
                    labelStyle: TextStyle(fontFamily: ReNestFont.avenir, fontWeight: FontWeight.bold, fontSize: 19),
                  ),
                ),
              )
            ],
          ),
        )
      ]),
    );
  }
}
