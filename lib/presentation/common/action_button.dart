import 'package:flutter/material.dart';

import 'common.dart';

class ActionButton extends StatelessWidget {
  final String title;
  final void Function() onTap;

  const ActionButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xff0d72ff),
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(15),
        child: Container(
          alignment: Alignment.center,
          height: 48,
          padding: const EdgeInsets.fromLTRB(15, 0, 14, 0),
          child: Text(title, style: Styles.button),
        ),
      ),
    );
  }
}
