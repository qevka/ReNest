import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/models/task_model.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/styles/colors.dart';
import 'package:renest/styles/fonts.dart';

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
        title: Text('Add Task'),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          children: [
            AddCell(
                title: "Go Shopping",
                onAdd: (task) {
                  print(task.toJson());
                })
          ],
        ),
      ),
    );
  }
}

class AddCell extends StatefulWidget {
  AddCell({required this.title, required this.onAdd});

  final Function(Task) onAdd;
  final String title;

  @override
  State<AddCell> createState() => _AddCellState();
}

class _AddCellState extends State<AddCell> with SingleTickerProviderStateMixin {
  bool isPlaying = false;
  late AnimationController _animationController;

  Task genTask(Priority pri) {
    return Task(name: widget.title, done: false, priority: pri);
  }

  void _startAnimation() async {
    if (isPlaying) {
      _animationController.reverse(from: 10);
      await Future.delayed(Duration(milliseconds: 450));
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
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: RenestColor.background,
      ),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              isPlaying ? Container() : Positioned(left: 20, child: Text(widget.title)),
              SlideTransition(
                position: _offsetAnimation,
                child: Row(
                  children: [
                    PriorityButton(
                        priority: Priority.high,
                        onPressed: (pri) {
                          widget.onAdd(genTask(pri));
                        }),
                    PriorityButton(
                        priority: Priority.normal,
                        onPressed: (pri) {
                          widget.onAdd(genTask(pri));
                        }),
                    PriorityButton(
                        priority: Priority.low,
                        onPressed: (pri) {
                          widget.onAdd(genTask(pri));
                        }),
                  ],
                ),
              ),
            ],
          ),
          GestureDetector(
              child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  transitionBuilder: (child, anim) => RotationTransition(
                        turns: child.key == ValueKey('icon1')
                            ? Tween<double>(begin: 1, end: 0.75).animate(anim)
                            : Tween<double>(begin: 0.75, end: 1).animate(anim),
                        child: ScaleTransition(scale: anim, child: child),
                      ),
                  child: isPlaying
                      ? Icon(Icons.close, key: const ValueKey('icon1'))
                      : Icon(
                          Icons.add,
                          key: const ValueKey('icon2'),
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
          width: 80,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: priority.color,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              priority.stringValue,
              style: TextStyle(fontFamily: ReNestFont.avenirBook, color: Colors.white),
              maxLines: 4,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
