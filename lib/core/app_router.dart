import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/core/route_paths.dart';

import '../logic/auth/auth_cubit.dart';
import '../logic/auth/auth_state.dart';
import '../presentation/screens/screens.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(
    routes: [
      GoRoute(
        path: RoutePaths.homeScreen,
        builder: (context, _) => BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) => state.when(
            initial: () => LoginScreen(),
            authSuccessful: () => const HomeScreen(),
            authFailed: () => LoginScreen(),
          ),
        ),
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
