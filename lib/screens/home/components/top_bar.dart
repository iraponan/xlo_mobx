import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/category/category_screen.dart';
import 'package:xlo_mobx/screens/filter/filter_screen.dart';
import 'package:xlo_mobx/screens/home/components/bar_button.dart';
import 'package:xlo_mobx/stores/home.dart';

class TopBar extends StatelessWidget {
  const TopBar({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeStore homeStore = GetIt.I<HomeStore>();

    return Observer(
      builder: (context) {
        return Row(
          children: [
            BarButton(
              label: homeStore.category?.description ?? 'Categorias',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.grey[400]!,
                  ),
                ),
              ),
              onTap: () async {
                final category = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CategoryScreen(
                      showAll: true,
                      selected: homeStore.category,
                    ),
                  ),
                );
                if (category != null) {
                  homeStore.setCategory(category);
                }
              },
            ),
            BarButton(
              label: 'Filtros',
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.grey[400]!),
                  left: BorderSide(color: Colors.grey[400]!),
                ),
              ),
              onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const FilterScreen())),
            ),
          ],
        );
      },
    );
  }
}
