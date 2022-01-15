import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          height: 60,
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w200),
                  icon: Icon(
                    Icons.search,
                    color: Colors.grey,
                  )),
            ),
          ),
        )
      ]),
    );
  }
}
