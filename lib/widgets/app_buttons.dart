import 'package:flutter/cupertino.dart';
import 'package:untitled/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color colorChosen;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  String? text;
  IconData? iconData;
  bool isIcon;


  AppButtons({Key? key,
      this.text = "Hi",
      this.isIcon = false,
      this.iconData,
      required this.size,
      required this.borderColor,
      required this.colorChosen,
      required this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: backgroundColor,
          border: Border.all(color: borderColor , width:  1),
      ),
      child: !isIcon ? Center(child: AppText(text: text!, color: colorChosen)) : Center(child: Icon(iconData, color: colorChosen,)),
    );
  }
}
