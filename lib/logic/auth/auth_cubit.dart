import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(const AuthState.initial());

  void login() {
    emit(const AuthState.authSuccessful());
  }

  void registration(String userName, String userEmail, String userPassword) {
    
  }

  void autoLogin() {}
}
