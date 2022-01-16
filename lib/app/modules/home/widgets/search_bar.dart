import 'package:ReNest/styles/colors.dart';
import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  SearchBar({required this.onChanged});

  Function(String) onChanged;
  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: ReNestColor.background),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 0, 0, 0),
        child: Row(
          children: [
            Center(
              child: Icon(
                Icons.search,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Center(
                child: TextField(
                  onChanged: onChanged,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Search",
                    hintStyle: TextStyle(color: ReNestColor.textFieldHintText, fontWeight: FontWeight.w200),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
