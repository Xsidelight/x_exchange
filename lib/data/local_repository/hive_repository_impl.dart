import 'package:hive_flutter/hive_flutter.dart';
import 'package:x_exchange/data/models/user.dart';
import 'package:x_exchange/domain/constants/constants.dart';
import 'package:x_exchange/domain/interfaces/i_hive_repository.dart';

class HiveRepositoryImpl extends IHiveRepository {
  Box box = Hive.box(HiveConstants.userCredBox);

  @override
  Future<void> clearUserCredBox() async {
    await box.clear();
  }

  @override
  User? getUserCredentials() {
    return box.get(HiveConstants.userCredentials);
  }

  @override
  Future<void> putUserCredentials({required User user}) async {
    await box.put(HiveConstants.userCredentials, user);
  }
}
