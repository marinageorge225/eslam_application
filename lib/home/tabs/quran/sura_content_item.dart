import 'package:flutter/material.dart';
import 'package:eslam_application/app_colors.dart';

class SuraContentItem extends StatefulWidget {
  String content;
  int index;

  SuraContentItem({required this.content, required this.index});

  @override
  SuraContentItemState createState() => SuraContentItemState();
}
class SuraContentItemState extends State<SuraContentItem> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Ink(
      child: InkWell(
        onTap: () {
          setState(() {
            isSelected = !isSelected;
          });
        },
        child: Container(
          margin:EdgeInsets.symmetric(horizontal: 35, vertical: 5),
          padding:EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: isSelected ? AppColours.primaryDark : Colors.transparent,
            border: Border.all(
              color: AppColours.primaryDark,
              width: 2,
            ),
          ),
          child: Text("[${widget.index + 1}] ${widget.content}",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18,
              color: isSelected ? AppColours.blackColour : AppColours.primaryDark,
            ),
          ),
        ),
      ),
    );
  }
}
