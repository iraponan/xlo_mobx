import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/screens/filter/components/order_by_field.dart';
import 'package:xlo_mobx/stores/filter.dart';

class FilterScreen extends StatelessWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final FilterStore filterStore = FilterStore();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filtrar Busca'),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    OrderByField(
                      filterStore: filterStore,
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
