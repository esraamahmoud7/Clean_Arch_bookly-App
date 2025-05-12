import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../../core/utils/styles.dart';

class BookRate extends StatelessWidget {
  const BookRate({super.key, this.mainAxisAlignment=MainAxisAlignment.start});

  final MainAxisAlignment mainAxisAlignment;

  @override
  Widget build(BuildContext context) {
    return Row(
    mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(FontAwesomeIcons.solidStar,color: Colors.yellow,size: 14,),
        const SizedBox(width: 10,),
        const Text("3.8",style: Styles.textStyle16,),
        const SizedBox(width: 6,),
        Opacity(opacity: .5,child: Text("(12345)",style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600))),

      ],
    );
  }
}