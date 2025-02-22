import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 24,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Username Or Email',
            ),
            style: AppTexts.fieldText(context),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            style: AppTexts.fieldText(context),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
