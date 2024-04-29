import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:xlo_mobx/screens/filter/components/sections/order_by/order_by_field.dart';
import 'package:xlo_mobx/screens/filter/components/sections/price/price_range_field.dart';
import 'package:xlo_mobx/screens/filter/components/sections/vendor/vendor_type_field.dart';
import 'package:xlo_mobx/stores/filter.dart';
import 'package:xlo_mobx/stores/home.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterStore filterStore = GetIt.I<HomeStore>().cloneFilter;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtro de Busca'),
        centerTitle: true,
      ),
      body: Observer(
        builder: (context) {
          return Center(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OrderByField(filterStore: filterStore),
                    PriceRangeField(filterStore: filterStore),
                    VendorTypeField(filterStore: filterStore),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 16),
                      height: 50,
                      child: ElevatedButton(
                        onPressed: filterStore.isFormValid
                            ? () {
                                filterStore.save();
                                Navigator.of(context).pop();
                              }
                            : null,
                        child: const Text(
                          'Filtrar',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
