import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../domain/models/models.dart';
import '../../../common/common.dart';

class PriceDetails extends StatelessWidget {
  final OrderModel order;
  final double totalPrice;

  const PriceDetails({
    super.key,
    required this.order,
    required this.totalPrice,
  });

  @override
  Widget build(BuildContext context) {
    final lc = AppLocalizations.of(context)!;
    const rowSpacer = TableRow(
      children: [
        SizedBox(height: 16),
        SizedBox(height: 16),
      ],
    );
    return SectionPlate(
      child: Table(
        children: [
          TableRow(
            children: [
              Text(lc.tourCorePrice, style: Styles.bodyGrey),
              _priceText(lc, order.tourPrice),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourFuelCharge, style: Styles.bodyGrey),
              _priceText(lc, order.fuelCharge),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourServiceCharge, style: Styles.bodyGrey),
              _priceText(lc, order.serviceCharge),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourPriceTotal, style: Styles.bodyGrey),
              _priceText(lc, totalPrice, style: Styles.priceTotal),
            ],
          ),
        ],
      ),
    );
  }

  Text _priceText(
    AppLocalizations lc,
    double price, {
    style = Styles.bodyBlack,
  }) {
    return Text(
      lc.tourPriceText(price),
      style: style,
      textAlign: TextAlign.end,
    );
  }
}
