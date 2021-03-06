import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/domain/constants/enums.dart';
import 'package:x_exchange/domain/router/route_paths.dart';
import 'package:x_exchange/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:x_exchange/presentation/home_screen/cubit/bottom_navigation_cubit.dart';
import 'package:x_exchange/presentation/screens.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const CoinsScreen(),
    const UserScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        state.whenOrNull(logout: () => context.go(RoutePaths.loginScreen));
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          actions: [
            IconButton(
              onPressed: () => context.read<AuthCubit>().logout(),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            return state.when(
                home: (navBarItem, index) => const CoinsScreen(),
                userCredentials: (navBarItem, index) => const UserScreen());
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
          builder: (context, state) {
            return BottomNavigationBar(
              onTap: (index) {
                if (index == 0) {
                  context.read<BottomNavigationCubit>().getNavBarItem(NavBarItem.home);
                } else if (index == 1) {
                  context.read<BottomNavigationCubit>().getNavBarItem(NavBarItem.userCredentials);
                }
              },
              currentIndex: state.index,
              items: const [
                BottomNavigationBarItem(
                  label: 'Home',
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  label: 'User',
                  icon: Icon(Icons.account_circle),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
