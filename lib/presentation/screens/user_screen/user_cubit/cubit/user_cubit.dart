import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

import '../../../../../core/constants.dart';
import '../../../../../data/models/user.dart';

part 'user_state.dart';
part 'user_cubit.freezed.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(const UserState.initial()) {
    getUserCredentials();
  }

  var box = Hive.box(HiveConstants.userCredBox);

  void getUserCredentials() {
    emit(const UserState.loading());

    try {
      var user = box.get(HiveConstants.userCredentials);
      emit(UserState.loaded(user));
    } catch (e) {
      emit(UserState.error(e.toString()));
    }
  }
}
