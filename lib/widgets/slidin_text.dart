import 'package:flutter/material.dart';

class SlidingText extends StatelessWidget {
  const SlidingText({super.key, required this.slidingAnimatin});

  final Animation<Offset> slidingAnimatin;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimatin,
      builder: (context, _) {
        return SlideTransition(
          position: slidingAnimatin,
          child:const Opacity(
            opacity: .6,
            child:  Text('Oprah Winfrey',style: TextStyle(
              fontSize: 24,
            
            ), textAlign: TextAlign.center),
          ),
        );
      },
    );
  }
}
