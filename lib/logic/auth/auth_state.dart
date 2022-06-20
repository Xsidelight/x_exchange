import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.authSuccessful() = AuthSuccessful;
  const factory AuthState.authFailed() = AuthFailed;
}
