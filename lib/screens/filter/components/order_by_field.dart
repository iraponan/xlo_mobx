import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/enums/order_by.dart';
import 'package:xlo_mobx/screens/filter/components/button_option.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({super.key, required this.filterStore});

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Ordenar por'),
            Row(
              children: [
                ButtonOptionFilter(
                  title: 'Data',
                  option: OrderBy.date,
                  filterStore: filterStore,
                ),
                const SizedBox(
                  width: 12,
                ),
                ButtonOptionFilter(
                  title: 'Preço',
                  option: OrderBy.price,
                  filterStore: filterStore,
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
