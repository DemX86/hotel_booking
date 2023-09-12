import 'package:flutter/material.dart';

import '../../../common/common.dart';

class AddTouristSection extends StatelessWidget {
  final void Function() onTap;

  const AddTouristSection({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SectionPlate(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Добавить туриста', style: Styles.title),
          _addButton(),
        ],
      ),
    );
  }

  Widget _addButton() {
    return Material(
      color: blueColor,
      borderRadius: BorderRadius.circular(6),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(6),
        child: Container(
          padding: const EdgeInsets.all(4),
          child: Image.asset(
            'assets/images/add.png',
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}
