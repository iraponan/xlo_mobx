import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/zip_code.dart';

class ZipCodeField extends StatelessWidget {
  const ZipCodeField({super.key});

  @override
  Widget build(BuildContext context) {
    final ZipCodeStore zipCodeStore = ZipCodeStore();

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
          decoration: const InputDecoration(
            labelText: 'CEP *',
            labelStyle: TextStyle(
              fontWeight: FontWeight.w800,
              color: Colors.grey,
              fontSize: 18,
            ),
            contentPadding: EdgeInsets.fromLTRB(16, 10, 12, 10),
          ),
        ),
        Observer(
          builder: (context) {
            if (zipCodeStore.address == null &&
                zipCodeStore.error.isEmpty &&
                !zipCodeStore.loading) {
              return Container();
            } else if (zipCodeStore.address == null &&
                zipCodeStore.error.isEmpty) {
              return const LinearProgressIndicator();
            } else if (zipCodeStore.error.isNotEmpty) {
              return Container(
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
              );
            } else {
              final address = zipCodeStore.address;
              return Container(
                alignment: Alignment.center,
                color: Colors.purple.withAlpha(150),
                height: 55,
                padding: const EdgeInsets.all(8),
                child: Text(
                  'Localização: ${address!.street}, ${address.district}, ${address.city.name} - ${address.uf.initials}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              );
            }
          },
        ),
      ],
    );
  }
}
