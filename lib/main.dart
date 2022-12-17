import 'package:batman_flutter_sign_in/widgets/city_widget.dart';
import 'package:batman_flutter_sign_in/widgets/screen_buttons.dart';
import 'package:batman_flutter_sign_in/widgets/screen_title.dart';
import 'package:batman_flutter_sign_in/widgets/signup_form.dart';
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
        primarySwatch: Colors.grey,
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
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animationLogoIn;
  late Animation<double> _animationLogoMovementUp;
  late Animation<double> _animationBatmanIn;
  late Animation<double> _animationButtonsIn;

  late AnimationController _animationControllerSignUp;
  late Animation<double> _animationLogoOut;
  late Animation<double> _animationBatmanUp;
  late Animation<double> _animationBatmanCity;
  late Animation<double> _animationSignUpIn;

  void _setUpFirstAnimations() {
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

  void _setUpSecondAnimations() {
    _animationControllerSignUp = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 6),
    );
    _animationLogoOut = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.0, 0.2),
    );
    _animationBatmanUp = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.35, 0.55),
    );
    _animationBatmanCity = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.65, 0.8),
    );
    _animationSignUpIn = CurvedAnimation(
      parent: _animationControllerSignUp,
      curve: const Interval(0.85, 1.0, curve: Curves.easeIn),
    );
  }

  @override
  void initState() {
    super.initState();
    _setUpFirstAnimations();
    _setUpSecondAnimations();
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationControllerSignUp.dispose();
    super.dispose();
  }

  void signUp() {
    _animationControllerSignUp.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _animationController.forward(from: 0.0);
        _animationControllerSignUp.reset();
      },
      child: AnimatedBuilder(
          animation: Listenable.merge(
              [_animationController, _animationControllerSignUp]),
          builder: (context, _) {
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
                    child: Transform.translate(
                      offset: Offset(
                          0.0,
                          60 * _animationLogoOut.value +
                              (-1 * 60 * _animationBatmanUp.value)),
                      child: Transform.scale(
                        scale: _animationBatmanIn.value,
                        child: Image.asset(
                          'assets/images/batman_alone.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 3.5,
                    left: 40,
                    right: 40,
                    child: CityWidget(
                      animation: _animationBatmanCity,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 1.8,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: SignUpForm(
                      animation: _animationSignUpIn,
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Transform.translate(
                          offset: Offset(0.0, 60 * _animationLogoOut.value),
                          child: Opacity(
                            opacity: (1 - _animationLogoOut.value),
                            child: ScreenTitle(
                              animation: _animationButtonsIn,
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Transform.translate(
                          offset: Offset(0.0, 60 * _animationLogoOut.value),
                          child: Opacity(
                            opacity: (1 - _animationLogoOut.value),
                            child: ScreenButtons(
                              animation: _animationButtonsIn,
                              onTap: signUp,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2.2 -
                        60 * _animationLogoMovementUp.value,
                    left: 0,
                    right: 0,
                    child: Opacity(
                      opacity: (1 - _animationLogoOut.value),
                      child: Transform.scale(
                        scale: _animationLogoIn.value,
                        child: Image.asset(
                          'assets/images/batman_logo.png',
                          height: 50,
                          fit: BoxFit.contain,
                        ),
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
