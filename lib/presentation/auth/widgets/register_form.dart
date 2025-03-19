import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_texts.dart';
import 'package:spotify_app/data/models/auth/create_user_request.dart';
import 'package:spotify_app/domain/usecases/auth/register.dart';
import 'package:spotify_app/presentation/root/pages/root_screen.dart';
import 'package:spotify_app/service_locator.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _email = '';
  String _password = '';

  String? _nameValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }
    if (value.trim().length < 2) {
      return 'Name must be at least 2 characters long';
    }
    return null;
  }

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

  void _onRegister() async {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    final result = await sl<RegisterUseCase>().call(
      params: CreateUserRequest(
        name: _name,
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
        MaterialPageRoute(builder: (_) => const RootScreen()),
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
              labelText: 'Full Name',
            ),
            style: AppTexts.fieldText(context),
            validator: _nameValidator,
            onSaved: (value) => _name = value!,
          ),
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
            onPressed: _onRegister,
            child: const Text('Create Account'),
          ),
        ],
      ),
    );
  }
}
