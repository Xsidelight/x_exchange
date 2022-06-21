import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants.dart';
import '../../../../../data/models/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  bool login({required String email, required String password}) {
    var box = Hive.box(HiveConstants.userCredBox);
    User savedUser = box.get(HiveConstants.userCredentials);

    if (email == savedUser.email && password == savedUser.password) {
      emit(const AuthState.authSuccessful());
      return true;
    }

    return false;
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
