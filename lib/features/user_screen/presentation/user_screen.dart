import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:x_exchange/domain/router/route_paths.dart';
import 'package:x_exchange/features/auth_screens/cubit/auth_cubit.dart';
import 'package:x_exchange/features/user_screen/user_cubit/cubit/user_cubit.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UserCubit(),
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          return state.when(
            initial: () => Container(),
            loading: () => const Center(child: CircularProgressIndicator()),
            loaded: (user) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text('User Credentials:'),
                  Text(user.name),
                  Text(
                    user.createdAt.toIso8601String(),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthCubit>().clearUserCredBox();
                      context.go(RoutePaths.loginScreen);
                    },
                    child: const Text('Delete User'),
                  ),
                ],
              ),
            ),
            error: (message) => Center(
              child: Text(message),
            ),
          );
        },
      ),
    );
  }
}
