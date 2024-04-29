import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PriceField extends StatelessWidget {
  const PriceField(
      {super.key, required this.label, this.onChanged, this.initialValue});

  final String label;
  final Function(num?)? onChanged;
  final num? initialValue;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        initialValue: initialValue?.toString(),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          isDense: true,
          labelText: label,
        ),
        keyboardType: TextInputType.number,
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          CentavosInputFormatter(moeda: true),
        ],
        style: const TextStyle(
          fontSize: 16,
        ),
        onChanged: (text) => onChanged != null
            ? onChanged!(
                num.tryParse(
                  text.replaceAll(RegExp('[^0-9,]'), '').replaceAll(',', '.'),
                ),
              )
            : {},
      ),
    );
  }
}
