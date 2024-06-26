import 'package:flutter/material.dart';
import 'package:xlo_mobx/helpers/enums/order_by.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/screens/filter/components/sections/order_by/button_option.dart';
import 'package:xlo_mobx/stores/filter.dart';

class OrderByField extends StatelessWidget {
  const OrderByField({super.key, required this.filterStore});

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SectionTitle(title: 'Ordenar por:'),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
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
  }
}
