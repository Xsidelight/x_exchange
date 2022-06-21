import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:x_exchange/data/models/user.dart';

import 'app/app.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  const secureStorage = FlutterSecureStorage();

  final encryptKey = await secureStorage.read(key: 'key');
  if (encryptKey == null) {
    final key = Hive.generateSecureKey();
    await secureStorage.write(
      key: 'key',
      value: base64UrlEncode(key),
    );
  }
  final key = await secureStorage.read(key: 'key');
  final encryptionKey = base64Url.decode(key!);

  await Hive.openBox('userCredBox', encryptionCipher: HiveAesCipher(encryptionKey));

  runApp(App());
}
