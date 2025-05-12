
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/utils/assets.dart';
import 'SlidingText.dart';
class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimation;

  int _Width=100;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initSlidingAnimation();
    NavigateHome();
  }
  void dispose()
  {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(AssetsData.logo),
        const SizedBox(height: 3,),
        SlidingText(slidingAnimation: slidingAnimation)
      ],
    );
  }
  void initSlidingAnimation() {
    animationController = AnimationController(vsync: this,duration: Duration(seconds: 1));

    slidingAnimation = Tween<Offset>(begin:const Offset(0, 2),end: Offset.zero).animate(animationController);

    animationController.forward();
  }

  void NavigateHome() {
    Future.delayed(Duration(seconds:2),(){
      // Get.to(()=>const Homeview(),
      //     transition: Transition.fade,
      //     duration: const Duration(milliseconds: 250));
      GoRouter.of(context).push("/homeView");
    });
  }
}
