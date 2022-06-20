import 'package:go_router/go_router.dart';
import 'package:x_exchange/presentation/screens/home_screen/home_screen.dart';

class AppRouter {
  final GoRouter goRouter = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login-screen',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/registration-screen',
      builder: (context, state) => const HomeScreen(),
    ),
  ]);
}
