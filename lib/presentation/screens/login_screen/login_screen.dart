import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/logic/auth/auth_cubit.dart';

import '../../../core/router/route_paths.dart';


class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter valid email';
                }
                return null;
              },
            ),
            TextFormField(
              controller: _passwordController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  context.read<AuthCubit>().login(
                        email: _emailController.text.trim(),
                        password: _passwordController.text.trim(),
                      );
                }
              },
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: () => context.push(RoutePaths.registrationScreen),
              child: const Text('Don\'t have an account? Sign up!'),
            ),
          ],
        ),
      ),
    );
  }
}
