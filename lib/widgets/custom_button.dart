import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' as vector;

class CustomButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;
  final bool isLeft;

  const CustomButton(
      {super.key,
      required this.onTap,
      required this.text,
      this.isLeft = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFDE86A),
      child: InkWell(
        onTap: onTap,
        child: ClipRect(
          child: SizedBox(
            height: 60,
            child: Stack(
              children: [
                if (isLeft)
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(-10.0)
                        ..rotateZ(vector.radians(35)),
                      child: Image.asset(
                        'assets/images/batman_logo.png',
                        fit: BoxFit.contain,
                        height: 40,
                        color: const Color(0xFFC8B853),
                      ),
                    ),
                  ),
                Center(
                  child: Text(
                    text,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                if (!isLeft)
                  Align(
                    alignment: Alignment.centerRight,
                    child: Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..translate(10.0)
                        ..rotateZ(vector.radians(-35)),
                      child: Image.asset(
                        'assets/images/batman_logo.png',
                        fit: BoxFit.contain,
                        height: 40,
                        color: const Color(0xFFC8B853),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
