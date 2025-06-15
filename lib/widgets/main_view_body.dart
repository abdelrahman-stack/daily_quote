import 'package:daily_quote/core/app_router.dart';
import 'package:daily_quote/widgets/slidin_text.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainViewBody extends StatefulWidget {
  const MainViewBody({super.key});

  @override
  State<MainViewBody> createState() => _MainViewBodyState();
}

class _MainViewBodyState extends State<MainViewBody>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> slidingAnimatin;
  @override
  void initState() {
    super.initState();
    initSlidingAnimation();
    navigatorToHome();
  }

  void navigatorToHome() {
    Future.delayed(const Duration(seconds: 2), () {
      // Get.to(
      //   () => const HomeView(),
      //   transition: Transition.fade,
      //   duration:const Duration(milliseconds: 250),
      // );
      GoRouter.of(context).push(AppRouter.kHomeView);
    });
  }

  @override
  void dispose() {
    super.dispose();
    animationController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '"Turn Your Wounds into Wisdom."',
            style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SlidingText(slidingAnimatin: slidingAnimatin),
        ],
      ),
    );
  }

  void initSlidingAnimation() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    slidingAnimatin = Tween<Offset>(
      begin: const Offset(0, 8),
      end: Offset.zero,
    ).animate(animationController);

    animationController.forward();
  }
}
