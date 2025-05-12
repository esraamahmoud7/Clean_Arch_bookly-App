import 'package:flutter/material.dart';

import '../utils/styles.dart';

class Custombutton extends StatelessWidget {
  const Custombutton({super.key, required this.backgroundColor, required this.textColor,  this.borderRadius, required this.text, this.fontSize,});

  final Color backgroundColor,textColor;
  final BorderRadius? borderRadius;
  final String text;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: TextButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(
              borderRadius: borderRadius ?? BorderRadius.circular(16)
            )
          ),
          child:  Text(text,
            style: Styles.textStyle18.copyWith(
                color: textColor,
              fontWeight: FontWeight.w900,
                fontSize: fontSize
            ),)
      ),
    );
  }
}
