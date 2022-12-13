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

class BatmanLogin extends StatelessWidget {
  const BatmanLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100F0B),
      body: Stack(children: [
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
          child: Image.asset(
            'assets/images/batman_alone.png',
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 3,
          left: 0,
          right: 0,
          child: Image.asset(
            'assets/images/batman_logo.png',
            height: 50,
            fit: BoxFit.contain,
          ),
        ),
        Positioned(
          top: MediaQuery.of(context).size.height / 2,
          left: 0,
          right: 0,
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
              SizedBox(height: 35),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  children: [
                    CustomButton(onTap: () {}, text: 'LOGIN'),
                    SizedBox(height: 35),
                    CustomButton(
                      onTap: () {},
                      text: 'SIGN-UP',
                      isLeft: true,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ]),
    );
  }
}
