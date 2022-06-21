import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:x_exchange/core/constants.dart';
import 'package:x_exchange/data/models/user.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void login({required String email, required String password}) {
    var box = Hive.box(HiveConstants.userCredBox);
    User savedUser = box.get(HiveConstants.userCredentials);

    if (email == savedUser.email && password == savedUser.password) {
      emit(const AuthState.authSuccessful());
    }
  }

  void registration({
    required String userName,
    required String userEmail,
    required String userPassword,
  }) {
    final user = User(
      name: userName,
      email: userEmail,
      password: userPassword,
      createdAt: DateTime.now(),
    );
    var box = Hive.box(HiveConstants.userCredBox);
    box.put(HiveConstants.userCredentials, user);
  }

  void autoLogin() {
    var box = Hive.box(HiveConstants.userCredBox);
    var savedUser = box.get(HiveConstants.userCredentials);

    if (savedUser == null) {
      emit(const AuthState.authFailed());
    }

    emit(const AuthState.authSuccessful());
  }
}
