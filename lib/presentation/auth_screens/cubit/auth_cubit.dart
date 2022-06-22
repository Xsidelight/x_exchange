import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_exchange/data/local_repository/hive_repository_impl.dart';
import 'package:x_exchange/data/models/user.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.hiveRepositoryImpl) : super(const AuthState.initial()) {
    autoLogin();
  }

  final HiveRepositoryImpl hiveRepositoryImpl;

  void login({required String email, required String password}) async {
    User? savedUser = hiveRepositoryImpl.getUserCredentials();

    if (savedUser == null) {
      emit(const AuthState.authFailed(message: 'Failed To Login!'));
      return;
    }

    if (email == savedUser.email && password == savedUser.password) {
      savedUser.isLoggedIn = true;
      await hiveRepositoryImpl.putUserCredentials(user: savedUser);
      emit(const AuthState.authSuccessful());
    } else {
      emit(const AuthState.authFailed(message: 'Failed To Login!'));
    }
  }

  void registration({
    required String userName,
    required String userEmail,
    required String userPassword,
  }) async {
    final user = User(
      name: userName,
      email: userEmail,
      password: userPassword,
      createdAt: DateTime.now(),
      isLoggedIn: true,
    );
    await hiveRepositoryImpl.putUserCredentials(user: user);

    emit(const AuthState.authSuccessful());
  }

  void autoLogin() async {
    final savedUser = hiveRepositoryImpl.getUserCredentials();

    if (savedUser != null && savedUser.isLoggedIn == true) {
      emit(const AuthState.authSuccessful());
    } else {
      emit(const AuthState.authFailed(message: 'No user found'));
    }
  }

  void clearUserCredBox() {
    hiveRepositoryImpl.clearUserCredBox();
    emit(const AuthState.logout());
  }

  void logout() async {
    final savedUser = hiveRepositoryImpl.getUserCredentials();

    if (savedUser!.isLoggedIn) {
      savedUser.isLoggedIn = false;
      hiveRepositoryImpl.putUserCredentials(user: savedUser);
      emit(const AuthState.logout());
    }
  }
}
