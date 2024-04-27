import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/create_ad.dart';
import 'package:xlo_mobx/stores/zip_code.dart';

class ZipCodeField extends StatelessWidget {
  ZipCodeField({super.key, required this.createAdStore})
      : zipCodeStore = createAdStore.zipCodeStore;

  final CreateAdStore createAdStore;
  final ZipCodeStore zipCodeStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              onChanged: zipCodeStore.setZipCode,
              keyboardType: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                CepInputFormatter(),
              ],
              decoration: InputDecoration(
                labelText: 'CEP *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Colors.grey,
                  fontSize: 18,
                ),
                contentPadding: const EdgeInsets.fromLTRB(16, 10, 12, 10),
                errorText: createAdStore.addressError.isEmpty
                    ? null
                    : createAdStore.addressError,
              ),
            ),
            zipCodeStore.address == null &&
                    zipCodeStore.error.isEmpty &&
                    !zipCodeStore.loading
                ? Container()
                : zipCodeStore.address == null && zipCodeStore.error.isEmpty
                    ? const LinearProgressIndicator()
                    : zipCodeStore.error.isNotEmpty
                        ? Container(
                            alignment: Alignment.center,
                            color: Colors.red.withAlpha(100),
                            height: 55,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              zipCodeStore.error,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.red,
                              ),
                            ),
                          )
                        : Container(
                            alignment: Alignment.center,
                            color: Colors.purple.withAlpha(150),
                            height: 55,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              'Localização: ${zipCodeStore.address?.street},'
                              ' ${zipCodeStore.address?.district},'
                              ' ${zipCodeStore.address?.city.name}'
                              ' - ${zipCodeStore.address?.uf.initials}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
          ],
        );
      },
    );
  }
}
