import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:renest/app/modules/home/controllers/home_controller.dart';
import 'package:renest/styles/colors.dart';

import 'clearable_text_form_field.dart';

class SearchBar extends GetView<HomeController> {
  SearchBar({required this.onChanged, this.onTap, this.shouldFocus = false});

  final Function()? onTap;
  final Function(String) onChanged;
  final bool shouldFocus;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 40,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: Material(
              child: Theme(
                data: ThemeData().copyWith(
                    backgroundColor: Colors.transparent,
                    dialogBackgroundColor: Colors.transparent,
                    canvasColor: Colors.transparent,
                    colorScheme: ColorScheme.light(primary: Colors.black38)),
                child: ClearableTextFormField(
                  autofocus: shouldFocus,
                  resetIcon: Icon(Icons.cancel),
                  controller: _controller,
                  onTap: onTap,
                  onChanged: onChanged,
                  showCursor: true,
                  decoration: InputDecoration(
                      hintText: "Search",
                      hintStyle: TextStyle(color: RenestColor.textFieldHintText),
                      contentPadding: EdgeInsets.only(left: 45),
                      filled: true,
                      fillColor: RenestColor.background,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(40),
                          borderSide: BorderSide(width: 0, style: BorderStyle.none))),
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 15,
          child: GestureDetector(
            onTap: () {
              print(_controller.value.text);
            },
            child: Icon(
              Icons.search,
              color: RenestColor.textFieldHintText,
            ),
          ),
        ),
      ],
    );
  }
}
