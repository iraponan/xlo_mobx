import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/create_ad.dart';
import 'package:xlo_mobx/stores/postal_code.dart';

class PostalCodeField extends StatelessWidget {
  PostalCodeField({super.key, required this.createAdStore})
      : postalCodeStore = createAdStore.postalCodeStore;

  final CreateAdStore createAdStore;
  final PostalCodeStore postalCodeStore;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              initialValue: postalCodeStore.postalCode,
              onChanged: postalCodeStore.setPostalCode,
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
            postalCodeStore.address == null &&
                    postalCodeStore.error.isEmpty &&
                    !postalCodeStore.loading
                ? Container()
                : postalCodeStore.address == null &&
                        postalCodeStore.error.isEmpty
                    ? const LinearProgressIndicator()
                    : postalCodeStore.error.isNotEmpty
                        ? Container(
                            alignment: Alignment.center,
                            color: Colors.red.withAlpha(100),
                            height: 55,
                            padding: const EdgeInsets.all(8),
                            child: Text(
                              postalCodeStore.error,
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
                              'Localização: ${postalCodeStore.address?.street},'
                              ' ${postalCodeStore.address?.district},'
                              ' ${postalCodeStore.address?.city.name}'
                              ' - ${postalCodeStore.address?.federativeUnit.initials}',
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
