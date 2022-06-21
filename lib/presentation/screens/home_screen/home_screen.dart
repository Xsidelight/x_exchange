import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/core/router/route_paths.dart';
import 'package:x_exchange/presentation/screens/auth_screens/auth/cubit/auth_cubit.dart';
import 'package:x_exchange/presentation/screens/coins_screen/coins_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final List<Widget> pages = [
    const CoinsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
              context.go(RoutePaths.loginScreen);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: pages[0],
      bottomNavigationBar: BottomNavigationBar(
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
      ),
    );
  }
}
