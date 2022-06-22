import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_exchange/data/local_repository/hive_storage.dart';
import 'package:x_exchange/data/models/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial()) {
    autoLogin();
  }

  final _hiveStorage = HiveStorage();

  void login({required String email, required String password}) {
    User? savedUser = _hiveStorage.getUserCredentials();

    if (savedUser == null) {
      emit(const AuthState.authFailed(message: 'Failed To Login!'));
    }

    if (email == savedUser!.email && password == savedUser.password) {
      emit(const AuthState.authSuccessful());
    } else {
      emit(const AuthState.authFailed(message: 'Failed To Login!'));
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
    _hiveStorage.putUserCredentials(user);
  }

  void autoLogin() {
    final savedUser = _hiveStorage.getUserCredentials();

    if (savedUser == null) {
      emit(const AuthState.authFailed(message: 'No user found'));
    } else {
      emit(const AuthState.authSuccessful());
    }
  }

  void logout() {
    _hiveStorage.clearBox();
  }
}
