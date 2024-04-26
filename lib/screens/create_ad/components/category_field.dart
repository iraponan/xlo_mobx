import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';
import 'package:xlo_mobx/stores/create_ad.dart';

class CategoryField extends StatelessWidget {
  const CategoryField({super.key, required this.createAdStore});

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return ListTile(
          title: Text(
            'Categoria *',
            style: TextStyle(
              fontWeight: createAdStore.category == null
                  ? FontWeight.w800
                  : FontWeight.w700,
              color: Colors.grey,
              fontSize: createAdStore.category == null ? 18 : 14,
            ),
          ),
          subtitle: Text(
            createAdStore.category?.description ?? '',
            style: const TextStyle(
              color: Colors.black,
              fontSize: 18,
            ),
          ),
          trailing: const Icon(Icons.keyboard_arrow_down),
          onTap: () async {
            final category = await showDialog(
              context: context,
              builder: (context) => CategoryScreen(
                showAll: false,
                selected: createAdStore.category,
              ),
            );
            if (category != null) {
              createAdStore.setCategory(category);
            }
          },
        );
      },
    );
  }
}
