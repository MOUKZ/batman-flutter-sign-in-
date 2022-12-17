import 'package:batman_flutter_sign_in/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class SignUpForm extends AnimatedWidget {
  const SignUpForm({super.key, required Animation animation})
      : super(listenable: animation);

  Animation get _animation => listenable as Animation;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Opacity(
        opacity: _animation.value,
        child: Transform.translate(
          offset: Offset(
            0.0,
            100 * (1 - _animation.value) as double,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'GET ACCESS',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                  label: 'FULL NAME',
                ),
                CustomTextField(
                  label: 'EMAIL',
                ),
                CustomTextField(
                  label: 'PASSWORD',
                  password: true,
                ),
                const SizedBox(height: 20),
                CustomButton(
                  onTap: () {},
                  text: 'SIGN-UP',
                  isLeft: true,
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final String label;
  final bool password;
  const CustomTextField(
      {super.key, required this.label, this.password = false});

  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey[800]!,
        // width: 2.5,
      ),
    );
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: TextField(
        obscureText: password,
        decoration: InputDecoration(
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
          labelStyle: TextStyle(color: Colors.grey[800]),
          border: border,
          enabledBorder: border,
        ),
      ),
    );
  }
}
