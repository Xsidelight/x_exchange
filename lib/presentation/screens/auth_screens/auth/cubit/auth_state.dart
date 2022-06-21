part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = _Initial;
  const factory AuthState.authSuccessful() = _AuthSuccessful;
  const factory AuthState.authFailed({required String message}) = _AuthFailed;
}
