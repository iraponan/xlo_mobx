import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/enums/order_by.dart';
import 'package:xlo_mobx/stores/filter.dart';

class ButtonOptionFilter extends StatelessWidget {
  const ButtonOptionFilter({
    super.key,
    required this.title,
    required this.option,
    required this.filterStore,
  });

  final String title;
  final OrderBy option;
  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return GestureDetector(
          onTap: () => filterStore.setOrderBy(option),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
              color: filterStore.orderBy == option
                  ? Colors.purple
                  : Colors.transparent,
              border: Border.all(
                  color: filterStore.orderBy == option
                      ? Colors.purple
                      : Colors.grey),
            ),
            height: 50,
            child: Text(
              title,
              style: TextStyle(
                color:
                    filterStore.orderBy == option ? Colors.white : Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
