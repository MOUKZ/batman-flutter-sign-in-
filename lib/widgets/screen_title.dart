import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ScreenTitle extends AnimatedWidget {
  const ScreenTitle({super.key, required Animation animation})
      : super(listenable: animation);

  Animation get _animationLogoMovementUp => listenable as Animation;
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _animationLogoMovementUp.value,
      child: Column(
        children: [
          Text(
            'Welcome to'.toUpperCase(),
            style: const TextStyle(fontSize: 22, color: Colors.white),
          ),
          Text(
            'gotham city'.toUpperCase(),
            style: const TextStyle(fontSize: 35, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
