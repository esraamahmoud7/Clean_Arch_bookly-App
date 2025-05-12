import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/AppRouters.dart';

class CustomAppBarBookDetails extends StatelessWidget {
  const CustomAppBarBookDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed:(){GoRouter.of(context).push(AppRouter.KHome);},
            icon: const Icon(Icons.close,size: 33,)
        ),
        IconButton(
            onPressed:(){GoRouter.of(context).push(AppRouter.KHome);},
            icon: const Icon(Icons.shopping_cart_outlined,size: 30,)
        ),
      ],
    );
  }
}