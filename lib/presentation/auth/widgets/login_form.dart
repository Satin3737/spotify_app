import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/data/models/auth/login_user_request.dart';
import 'package:spotify_app/domain/usecases/auth/login.dart';
import 'package:spotify_app/presentation/home/pages/home_screen.dart';
import 'package:spotify_app/service_locator.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';

  String? _emailValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  String? _passwordValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  void _onLogin() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    final result = await sl<LoginUserUseCase>().call(
      params: LoginUserRequest(
        email: _email,
        password: _password,
      ),
    );

    result.fold(
      (error) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      ),
      (success) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (_) => const HomeScreen()),
        (route) => false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        spacing: 24,
        children: [
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Enter Email',
            ),
            style: AppTexts.fieldText(context),
            keyboardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none,
            autocorrect: false,
            validator: _emailValidator,
            onSaved: (value) => _email = value!,
          ),
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Password',
            ),
            style: AppTexts.fieldText(context),
            obscureText: true,
            validator: _passwordValidator,
            onSaved: (value) => _password = value!,
          ),
          ElevatedButton(
            onPressed: _onLogin,
            child: const Text('Sign In'),
          ),
        ],
      ),
    );
  }
}
