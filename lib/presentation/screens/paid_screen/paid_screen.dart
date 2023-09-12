import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../common/common.dart';

final random = Random();

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final orderNumber = random.nextInt(10000);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Заказ оплачен', style: Styles.appBarTitle),
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color(0xfff6f6f9),
                      radius: 47,
                      child: Image.asset(
                        'assets/images/party_popper.png',
                        width: 44,
                        height: 44,
                      ),
                    ),
                    const SizedBox(height: 32),
                    const Text(
                      'Ваш заказ принят в работу',
                      style: Styles.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                        'Подтверждение заказа №$orderNumber может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.',
                        style: Styles.bodyGrey,
                        textAlign: TextAlign.center),
                  ],
                ),
              ),
            ),
          ),
          BottomPlate(
            child: ActionButton(
              title: 'Супер!',
              onTap: () => context.go('/hotel'),
            ),
          ),
        ],
      ),
    );
  }
}
