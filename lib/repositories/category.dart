import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/repositories/erros/parse_erros.dart';
import 'package:xlo_mobx/repositories/keys/category.dart';

class CategoryRepository {
  Future<List<Category>> getList() async {
    final queryBuilder = QueryBuilder(ParseObject(keyCategoryTable))
      ..orderByAscending(keyCategoryDescription);

    final response = await queryBuilder.query();

    if (response.success) {
      return response.results!.map((p) => Category.fromParse(p)).toList();
    } else {
      throw ParseErrors.getDescription(response.error!.code);
    }
  }
}
