import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_exchange/data/api/coins_api.dart';
import 'package:x_exchange/data/local_repository/hive_repository_impl.dart';
import 'package:x_exchange/data/repository/coins_repository_impl.dart';
import 'package:x_exchange/domain/router/app_router.dart';
import 'package:x_exchange/presentation/auth_screens/cubit/auth_cubit.dart';
import 'package:x_exchange/presentation/blocs/bottom_navigation/cubit/bottom_navigation_cubit.dart';
import 'package:x_exchange/presentation/coins_screen/cubit/coins_cubit.dart';

class App extends StatelessWidget {
  App({Key? key}) : super(key: key);

  final router = AppRouter().goRouter;

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (_) => CoinsRepositoryImpl(CoinsApi()),
        ),
        RepositoryProvider(create: (_) => HiveRepositoryImpl()),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => AuthCubit(context.read<HiveRepositoryImpl>()),
          ),
          BlocProvider(
            create: (context) => CoinsCubit(coinsRepository: context.read<CoinsRepositoryImpl>()),
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
      ),
    );
  }
}
