import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/screens/filter/components/sections/price/price_field.dart';
import 'package:xlo_mobx/stores/filter.dart';

class PriceRangeField extends StatelessWidget {
  const PriceRangeField({super.key, required this.filterStore});

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Preço:'),
            Row(
              children: [
                PriceField(
                  label: 'MIN',
                  onChanged: filterStore.setMinPrice,
                  initialValue: filterStore.minPrice,
                ),
                const SizedBox(
                  width: 12,
                ),
                PriceField(
                  label: 'MAX',
                  onChanged: filterStore.setMaxPrice,
                  initialValue: filterStore.maxPrice,
                ),
              ],
            ),
            filterStore.priceError.isNotEmpty
                ? Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      filterStore.priceError!,
                      style: const TextStyle(
                        color: Color(0xffb3261e),
                        fontSize: 12,
                      ),
                    ),
                  )
                : Container(),
          ],
        );
      },
    );
  }
}
