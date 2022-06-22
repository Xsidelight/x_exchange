import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/features/auth_screens/cubit/auth_cubit.dart';
import 'package:x_exchange/features/screens.dart';


import 'route_paths.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: RoutePaths.homeScreen,
        builder: (context, _) => const _HomeRouteBuilder(),
      ),
      GoRoute(
        path: RoutePaths.loginScreen,
        builder: (context, state) => LoginScreen(),
      ),
      GoRoute(
        path: RoutePaths.registrationScreen,
        builder: (context, state) => RegistrationScreen(),
      ),
    ],
  );
}

class _HomeRouteBuilder extends StatelessWidget {
  const _HomeRouteBuilder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) => state.when(
        initial: () => LoginScreen(),
        authSuccessful: () => HomeScreen(),
        authFailed: (_) => LoginScreen(),
      ),
    );
  }
}
