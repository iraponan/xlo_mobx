import 'package:xlo_mobx/enums/user_type.dart';

class User {
  User(
      {this.id,
      required this.name,
      required this.email,
      required this.phone,
      this.password,
      this.type = UserType.particular,
      this.createdAt});

  String? id;
  String name;
  String email;
  String phone;
  String? password;
  UserType type;
  DateTime? createdAt;

  @override
  String toString() {
    return 'User{id: $id, name: $name, email: $email, phone: $phone, password: $password, type: $type, createdAt: $createdAt}';
  }
}
