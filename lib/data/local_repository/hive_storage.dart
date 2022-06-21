import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../core/constants.dart';
import '../models/user.dart';

class HiveStorage {
  var box = Hive.box(HiveConstants.userCredBox);

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
