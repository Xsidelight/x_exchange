import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../core/router/app_router.dart';
import '../data/repository/coins_repository.dart';
import '../presentation/screens/auth_screens/auth/cubit/auth_cubit.dart';
import '../presentation/screens/coins_screen/coins_cubit/cubit/coins_cubit.dart';

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
