import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app/app.dart';
import 'domain/constants/constants.dart';
import 'data/models/user.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  const secureStorage = FlutterSecureStorage();

  final encryptKey = await secureStorage.read(key: HiveConstants.userBoxKey);
  if (encryptKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: HiveConstants.userBoxKey,
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: HiveConstants.userBoxKey);
  final encryptionKey = base64Url.decode(key!);

  await Hive.openBox(HiveConstants.userCredBox, encryptionCipher: HiveAesCipher(encryptionKey));

  runApp(App());
}
