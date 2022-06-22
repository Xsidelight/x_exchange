import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_exchange/data/repository/coins_repository.dart';
import 'package:x_exchange/domain/router/app_router.dart';
import 'package:x_exchange/features/auth_screens/cubit/auth_cubit.dart';
import 'package:x_exchange/features/blocs/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:x_exchange/features/coins_screen/cubit/coins_cubit.dart';

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
