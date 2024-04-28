import 'package:flutter/material.dart';

class BarButton extends StatelessWidget {
  const BarButton(
      {super.key,
      required this.label,
      required this.decoration,
      required this.onTap});

  final String label;
  final BoxDecoration decoration;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: 40,
          alignment: Alignment.center,
          decoration: decoration,
          child: Text(
            label,
            style: TextStyle(
              color: Colors.white,
              fontSize: label.length > 22 ? 14 : 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
