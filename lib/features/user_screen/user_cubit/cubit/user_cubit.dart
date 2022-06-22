import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:x_exchange/data/local_repository/hive_storage.dart';
import 'package:x_exchange/data/models/user.dart';



part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial()) {
    getUserCredentials();
  }

  final _hiveStorage = HiveStorage();

  void getUserCredentials() {
    emit(const UserState.loading());

    try {
      final user = _hiveStorage.getUserCredentials();
      emit(UserState.loaded(user!));
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
