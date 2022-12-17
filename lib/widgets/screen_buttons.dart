import 'package:batman_flutter_sign_in/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class ScreenButtons extends AnimatedWidget {
  final VoidCallback onTap;
  const ScreenButtons(
      {super.key, required Animation animation, required this.onTap})
      : super(listenable: animation);
  Animation get _animationButtonsIn => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animationButtonsIn.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animationButtonsIn.value) as double,
          ),
          child: Column(
            children: [
              CustomButton(onTap: () {}, text: 'LOGIN'),
              const SizedBox(height: 35),
              CustomButton(
                onTap: onTap,
                text: 'SIGN-UP',
                isLeft: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
