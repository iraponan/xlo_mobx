import 'package:xlo_mobx/models/enums/user_type.dart';

class User {
  User(
      {required this.name,
      required this.email,
      required this.phone,
      required this.password,
      this.type = UserType.particular});

  String name;
  String email;
  String phone;
  String password;
  UserType type;
}
