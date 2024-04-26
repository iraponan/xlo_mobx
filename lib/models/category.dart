import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/repositories/keys/category.dart';

class Category {
  Category({this.id, required this.description});

  Category.fromParse(ParseObject parseObject)
      : id = parseObject.objectId,
        description = parseObject.get(keyCategoryDescription);

  final String? id;
  final String description;

  @override
  String toString() {
    return 'Category{id: $id, description: $description}';
  }
}
