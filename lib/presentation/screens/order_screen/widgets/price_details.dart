import 'package:flutter/material.dart';
import 'package:hotel_booking/domain/models/models.dart';

import '../../../../utils/constants.dart';
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
              const Text('Тур', style: Styles.bodyGrey),
              _priceText(order.tourPrice),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Топливный сбор', style: Styles.bodyGrey),
              _priceText(order.fuelCharge),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Сервисный сбор', style: Styles.bodyGrey),
              _priceText(order.serviceCharge),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('К оплате', style: Styles.bodyGrey),
              _priceText(totalPrice, style: Styles.priceTotal),
            ],
          ),
        ],
      ),
    );
  }

  Text _priceText(double price, {style = Styles.bodyBlack}) {
    return Text(
      '${numberFormat.format(price.round())} ₽',
      style: style,
      textAlign: TextAlign.end,
    );
  }
}
