import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/helpers/consts/vendor.dart';
import 'package:xlo_mobx/screens/filter/components/section_title.dart';
import 'package:xlo_mobx/stores/filter.dart';

class VendorTypeField extends StatelessWidget {
  const VendorTypeField({super.key, required this.filterStore});

  final FilterStore filterStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(title: 'Tipo de anunciante:'),
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              runSpacing: 4,
              children: [
                GestureDetector(
                  onTap: () => filterStore.isTypeParticular
                      ? filterStore.isTypeProfessional
                          ? filterStore.resetVendorType(vendorTypeParticular)
                          : filterStore.selectVendorType(vendorTypeProfessional)
                      : filterStore.setVendorType(vendorTypeParticular),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: filterStore.isTypeParticular
                            ? Colors.purple
                            : Colors.grey,
                      ),
                      color: filterStore.isTypeParticular
                          ? Colors.purple
                          : Colors.transparent,
                    ),
                    child: Text(
                      'Particular',
                      style: TextStyle(
                        color: filterStore.isTypeParticular
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 12,
                ),
                GestureDetector(
                  onTap: () => filterStore.isTypeProfessional
                      ? filterStore.isTypeParticular
                          ? filterStore.resetVendorType(vendorTypeProfessional)
                          : filterStore.selectVendorType(vendorTypeParticular)
                      : filterStore.setVendorType(vendorTypeProfessional),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      border: Border.all(
                        color: filterStore.isTypeProfessional
                            ? Colors.purple
                            : Colors.grey,
                      ),
                      color: filterStore.isTypeProfessional
                          ? Colors.purple
                          : Colors.transparent,
                    ),
                    child: Text(
                      'Profissional',
                      style: TextStyle(
                        color: filterStore.isTypeProfessional
                            ? Colors.white
                            : Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }
}
