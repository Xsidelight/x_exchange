import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/router/app_router.dart';
import '../data/repository/coins_repository.dart';
import '../logic/auth/cubit/auth_cubit.dart';
import '../logic/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import '../logic/coins_cubit/cubit/coins_cubit.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final router = AppRouter().goRouter;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
        BlocProvider(
          create: (context) => CoinsCubit(coinsRepository: CoinsRepository()),
        ),
        BlocProvider(
          create: (context) => BottomNavigationCubit(),
        )
      ],
      child: MaterialApp.router(
        routeInformationParser: router.routeInformationParser,
        routerDelegate: router.routerDelegate,
        routeInformationProvider: router.routeInformationProvider,
      ),
    );
  }
}
