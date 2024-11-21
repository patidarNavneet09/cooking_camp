
import 'package:cooking_champs/constant/my_color.dart';
import 'package:flutter/material.dart';


class GlobalButton extends StatelessWidget {
  String btnName;
  Color bgColor;
  Color borderColor;
  double height;
  double width;
  GestureTapCallback onTap;
  double radius;
  double elevation;
  double borderWidth;
  TextStyle style;

  GlobalButton(this.btnName, this.bgColor, this.borderColor, this.height,
      this.width, this.onTap,this.radius,this.elevation,this.borderWidth, this.style, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(color: borderColor,width: borderWidth)
      ),
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              padding: EdgeInsets.zero,
              elevation: elevation,
              overlayColor:
              MyColor
                  .liteOrange,
              backgroundColor: bgColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(radius))
          ),
          onPressed: onTap,
          child: Text(btnName,style: style)),
    );
  }
}