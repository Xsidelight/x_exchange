import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/core/route_paths.dart';
import 'package:x_exchange/logic/auth/auth_cubit.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
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
            TextFormField(),
            TextFormField(),
            ElevatedButton(
              onPressed: () => context.read<AuthCubit>().login(),
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
