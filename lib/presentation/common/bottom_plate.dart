import 'package:flutter/material.dart';

class BottomPlate extends StatelessWidget {
  final Widget child;

  const BottomPlate({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 88,
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xffe8e9ec))),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 12, 16, 28),
      child: child,
    );
  }
}
