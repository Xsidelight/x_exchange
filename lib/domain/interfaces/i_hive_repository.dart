import 'package:x_exchange/data/models/user.dart';

abstract class IHiveRepository {
  User? getUserCredentials();

  Future<void> putUserCredentials({required User user});

  Future<void> clearUserCredBox();
}
