import 'package:flutter/material.dart';

class RightToLeftTransition extends PageRouteBuilder {
  final Widget page;
  RightToLeftTransition(this.page)
      : super(
            pageBuilder: (context, animation, anotherAnimation) => page,
            transitionDuration: const Duration(milliseconds: 500),
            reverseTransitionDuration: const Duration(milliseconds: 200),
            transitionsBuilder: (context, animation, anotherAnimation, child) {
              animation = CurvedAnimation(
                  parent: animation,
                  curve: Curves.fastLinearToSlowEaseIn,
                  reverseCurve: Curves.fastOutSlowIn);
              return SlideTransition(
                position: Tween(begin: const Offset(1.0, 0.0), end: Offset.zero)
                    .animate(animation),
                child: page,
              );
            });
}
