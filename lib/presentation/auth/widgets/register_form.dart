import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        spacing: 24,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Full Name',
            ),
            style: AppTexts.fieldText(context),
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Email',
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
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
