import 'dart:developer';

import 'package:batman_flutter_sign_in/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const BatmanLogin(),
    );
  }
}

class BatmanLogin extends StatefulWidget {
  const BatmanLogin({super.key});

  @override
  State<BatmanLogin> createState() => _BatmanLoginState();
}

class _BatmanLoginState extends State<BatmanLogin>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsIn;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    );

    _animationLogoIn = Tween(begin: 40.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(0.0, 0.25),
      ),
    );

    _animationLogoMovementUp = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.35, 0.60),
    );

    _animationBatmanIn = Tween(begin: 5.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: const Interval(
          0.7,
          1.0,
          curve: Curves.decelerate,
        ),
      ),
    );

    _animationButtonsIn = CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.7, 1.0),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
      },
      child: AnimatedBuilder(
          animation: _animationController,
          builder: (context, _) {
            log(_animationButtonsIn.value.toString());
            return Scaffold(
              backgroundColor: const Color(0xFF100F0B),
              body: Stack(
                children: [
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scaleY: 1.5,
                      child: Image.asset(
                        'assets/images/batman_background.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 30,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: _animationBatmanIn.value,
                      child: Image.asset(
                        'assets/images/batman_alone.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Opacity(
                          opacity: _animationLogoMovementUp.value,
                          child: Column(
                            children: [
                              Text(
                                'Welcome to'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 22, color: Colors.white),
                              ),
                              Text(
                                'gotham city'.toUpperCase(),
                                style: const TextStyle(
                                    fontSize: 35, color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 35),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Opacity(
                            opacity: _animationButtonsIn.value,
                            child: Transform.translate(
                              offset: Offset(
                                  0.0, 100 * (1 - _animationButtonsIn.value)),
                              child: Column(
                                children: [
                                  CustomButton(onTap: () {}, text: 'LOGIN'),
                                  const SizedBox(height: 35),
                                  CustomButton(
                                    onTap: () {},
                                    text: 'SIGN-UP',
                                    isLeft: true,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.2 -
                        75 * _animationLogoMovementUp.value,
                    left: 0,
                    right: 0,
                    child: Transform.scale(
                      scale: _animationLogoIn.value,
                      child: Image.asset(
                        'assets/images/batman_logo.png',
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
