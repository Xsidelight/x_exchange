import 'package:hive_flutter/hive_flutter.dart';
import 'package:x_exchange/data/models/user.dart';
import 'package:x_exchange/domain/constants/constants.dart';

class HiveStorage {
  Box box = Hive.box(HiveConstants.userCredBox);

  User? getUserCredentials() {
    return box.get(HiveConstants.userCredentials);
  }

  void putUserCredentials(User user) {
    box.put(HiveConstants.userCredentials, user);
  }

  void clearBox() {
    box.clear();
  }
}
