import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/components/error_box.dart';
import 'package:xlo_mobx/models/category.dart';
import 'package:xlo_mobx/stores/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, this.showAll = true, this.selected});

  final Category? selected;
  final bool showAll;

  @override
  Widget build(BuildContext context) {
    final CategoryStore categoryStore = GetIt.I<CategoryStore>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.fromLTRB(32, 12, 32, 32),
          child: Observer(
            builder: (context) {
              if (categoryStore.error.isNotEmpty) {
                return ErrorBox(
                  message: categoryStore.error,
                );
              } else if (categoryStore.categoryList.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                final categories = showAll
                    ? categoryStore.allCategoryList
                    : categoryStore.categoryList;
                return ListView.separated(
                  itemBuilder: (context, index) {
                    final category = categories[index];
                    return InkWell(
                      onTap: () {
                        Navigator.of(context).pop(category);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 50,
                        color: category.id == selected?.id
                            ? Colors.purple.withAlpha(50)
                            : null,
                        child: Text(
                          category.description,
                          style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: category.id == selected?.id
                                  ? FontWeight.bold
                                  : null),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return const Divider(
                      height: 0.1,
                      color: Colors.grey,
                    );
                  },
                  itemCount: categories.length,
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
