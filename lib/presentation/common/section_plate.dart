import 'package:flutter/material.dart';

class SectionPlate extends StatelessWidget {
  final Widget child;
  const SectionPlate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 8),
      width: double.infinity,
      child: child,
    );
  }
}
