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
      print('sdfsddsfdds');
      return;
    }

    if (email == savedUser.email && password == savedUser.password) {
      savedUser.isLoggedIn = true;
      _hiveStorage.putUserCredentials(savedUser);
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
      isLoggedIn: true,
    );
    _hiveStorage.putUserCredentials(user);

    emit(const AuthState.authSuccessful());
  }

  void autoLogin() {
    final savedUser = _hiveStorage.getUserCredentials();

    if (savedUser != null && savedUser.isLoggedIn == true) {
      emit(const AuthState.authSuccessful());
    } else {
      emit(const AuthState.authFailed(message: 'No user found'));
    }
  }

  void clearUserCredBox() {
    _hiveStorage.clearBox();
    emit(const AuthState.logout());
  }

  void logout() {
    final savedUser = _hiveStorage.getUserCredentials();

    if (savedUser!.isLoggedIn) {
      print('Here');
      savedUser.isLoggedIn = false;
      _hiveStorage.putUserCredentials(savedUser);
      emit(const AuthState.logout());
    }
  }
}
