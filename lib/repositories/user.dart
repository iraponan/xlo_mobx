import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/enums/user_type.dart';
import 'package:xlo_mobx/models/user.dart';
import 'package:xlo_mobx/repositories/erros/parse_erros.dart';
import 'package:xlo_mobx/repositories/keys/user.dart';

class UserRepository {
  Future<User> signUp(User user) async {
    final parseUser = ParseUser(
      user.email,
      user.password,
      user.email,
    );

    parseUser.set<String>(keyUserName, user.name);
    parseUser.set<String>(keyUserPhone, user.phone);
    parseUser.set<int>(keyUserType, user.type.index);

    final response = await parseUser.signUp();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

  Future<User> loginWithEmail(String email, String password) async {
    final parseUser = ParseUser(email, password, null);
    final response = await parseUser.login();

    if (response.success) {
      return mapParseToUser(response.result);
    } else {
      return Future.error(
          ParseErrors.getDescription(response.error?.code ?? -1));
    }
  }

  Future<User?> currentUser() async {
    final parserUser = await ParseUser.currentUser();
    if (parserUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parserUser.sessionToken);
      if (response!.success) {
        return mapParseToUser(response.result);
      } else {
        await parserUser.logout();
      }
    }
    return null;
  }

  User mapParseToUser(ParseUser parseUser) {
    return User(
      id: parseUser.objectId,
      name: parseUser.get(keyUserName),
      email: parseUser.get(keyUserEmail),
      phone: parseUser.get(keyUserPhone),
      type: UserType.values[parseUser.get(keyUserType)],
      createdAt: parseUser.get(keyUserCreatedAt),
    );
  }
}
