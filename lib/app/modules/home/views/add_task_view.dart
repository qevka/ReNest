import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

var mockTasks = [
  "Setup Phone Service",
  "Find a local doctor",
  "Order cleaning supplies",
  "Pay property tax",
  "Find tree trimmer"
];

class AddTaskView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: Icon(Icons.arrow_back_ios),
          onTap: () {
            Get.back();
          },
        ),
        title: Text(
          'Add Task',
          style:
              TextStyle(fontFamily: ReNestFont.avenirLight, fontWeight: FontWeight.normal, color: RenestColor.taskTextColor),
        ),
        centerTitle: true,
      ),
      body: Container(
          height: Get.height,
          width: Get.width,
          child: ListView(
            children: mockTasks.map((e) => AddCell(title: e)).toList(),
          )),
    );
  }
}

class AddCell extends StatefulWidget {
  AddCell({required this.title});

  final String title;

  @override
  State<AddCell> createState() => _AddCellState();
}

class _AddCellState extends State<AddCell> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController _animationController;

  addTask(Priority pri) {
    _startAnimation();
    var task = Task(name: widget.title, done: false, priority: pri);
    Get.find<HomeController>().addTask(task);
  }

  void _startAnimation() async {
    if (isPlaying) {
      _animationController.reverse(from: 10);
      setState(() {
        isPlaying = !isPlaying;
      });
    } else {
      setState(() {
        isPlaying = !isPlaying;
      });
      _animationController.forward(from: 0);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 1000));
  }

  late final Animation<Offset> _offsetAnimation = Tween<Offset>(
    begin: const Offset(-1, 0.0),
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _animationController, curve: Curves.bounceOut, reverseCurve: Curves.bounceIn));

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              isPlaying
                  ? Container()
                  : Positioned(
                      left: 20,
                      child: Text(
                        widget.title,
                        style: TextStyle(fontFamily: ReNestFont.avenirBook, color: RenestColor.taskTextColor, fontSize: 22),
                      )),
              SlideTransition(
                position: _offsetAnimation,
                child: Row(
                  children: [
                    PriorityButton(
                        priority: Priority.high,
                        onPressed: (pri) {
                          addTask(pri);
                        }),
                    PriorityButton(
                        priority: Priority.normal,
                        onPressed: (pri) {
                          addTask(pri);
                        }),
                    PriorityButton(
                        priority: Priority.low,
                        onPressed: (pri) {
                          addTask(pri);
                        }),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 250),
                  transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: ScaleTransition(scale: anim, child: child),
                      ),
                  child: isPlaying
                      ? Icon(
                          Icons.close,
                          key: const ValueKey('icon1'),
                          color: RenestColor.textFieldHintText,
                          size: 40,
                        )
                      : Icon(
                          Icons.add_sharp,
                          key: const ValueKey('icon2'),
                          color: RenestColor.taskTextColor,
                          size: 40,
                        )),
              onTap: () {
                _startAnimation();
              }),
        ],
      ),
    );
  }
}

class PriorityButton extends StatelessWidget {
  PriorityButton({required this.priority, required this.onPressed});

  final Function(Priority) onPressed;
  final Priority priority;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: GestureDetector(
        onTap: () {
          onPressed(priority);
        },
        child: Container(
          width: Get.width / 3 - 40,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: priority.color,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Container(
              width: 80,
              child: Text(
                priority.stringValue,
                style: TextStyle(fontFamily: ReNestFont.avenirBook, color: Colors.white),
                maxLines: 4,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
