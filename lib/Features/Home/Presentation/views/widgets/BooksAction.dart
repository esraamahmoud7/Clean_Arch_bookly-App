import 'package:flutter/material.dart';

import '../../../../../core/widgets/CustomButton.dart';


class BooksAction extends StatelessWidget {
  const BooksAction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Expanded(child: Custombutton(
            text:"19.99€" ,
            backgroundColor: Color(0xffffffff),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12)
            ),
            textColor: Color(0xff000000),)
          ),
          Expanded(child: Custombutton(
            text: "Free preview",
            backgroundColor: Color(0xffEF8262),
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12)
            ),
            textColor: Color(0xffffffff),)
          )

        ],
      ),
    );
  }
}


