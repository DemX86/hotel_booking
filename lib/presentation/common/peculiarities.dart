import 'package:flutter/material.dart';

import 'common.dart';

class Peculiarities extends StatelessWidget {
  final List<String> peculiarities;

  const Peculiarities(this.peculiarities, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: peculiarities.map((item) => Peculiarity(item)).toList(),
      ),
    );
  }
}

class Peculiarity extends StatelessWidget {
  final String text;

  const Peculiarity(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(text, style: Styles.peculiarity),
    );
  }
}
