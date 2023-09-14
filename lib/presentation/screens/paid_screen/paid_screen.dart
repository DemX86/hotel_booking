import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

import '../../common/common.dart';

final random = Random();

class PaidScreen extends StatelessWidget {
  const PaidScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final lc = AppLocalizations.of(context)!;
    final orderNumber = random.nextInt(10000);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(lc.paidScreenName, style: Styles.appBarTitle),
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
                    Text(
                      lc.paidOrderReceived,
                      style: Styles.title,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      lc.paidDescription(orderNumber),
                      style: Styles.bodyGrey,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomPlate(
            child: ActionButton(
              title: lc.paidFinishButton,
              onTap: () => context.go('/hotel'),
            ),
          ),
        ],
      ),
    );
  }
}
