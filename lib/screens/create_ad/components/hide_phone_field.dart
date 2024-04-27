import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:xlo_mobx/stores/create_ad.dart';

class HidePhoneField extends StatelessWidget {
  const HidePhoneField({super.key, required this.createAdStore});

  final CreateAdStore createAdStore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(
            builder: (context) {
              return Checkbox(
                value: createAdStore.hidePhone,
                onChanged: createAdStore.setHidePhone,
              );
            },
          ),
          const Expanded(
            child: Text('Ocultar o meu telefone neste anúncio.'),
          ),
        ],
      ),
    );
  }
}
