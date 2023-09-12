import 'package:flutter/material.dart';

import '../../../../domain/models/models.dart';
import '../../../common/common.dart';

class TourDetails extends StatelessWidget {
  final OrderModel order;

  const TourDetails({super.key, required this.order});

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
        columnWidths: const {
          0: FixedColumnWidth(140),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              const Text('Вылет из', style: Styles.bodyGrey),
              Text(order.departure, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Страна, город', style: Styles.bodyGrey),
              Text(order.arrival, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Даты', style: Styles.bodyGrey),
              Text(
                '${order.tourDateStart}−${order.tourDateEnd}',
                style: Styles.bodyBlack,
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Кол-во ночей', style: Styles.bodyGrey),
              Text('${order.nightsCount} ночей', style: Styles.bodyBlack),
              // TODO add plurals
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Отель', style: Styles.bodyGrey),
              Text(order.hotelName, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Номер', style: Styles.bodyGrey),
              Text(order.roomName, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              const Text('Питание', style: Styles.bodyGrey),
              Text(order.nutrition, style: Styles.bodyBlack),
            ],
          ),
        ],
      ),
    );
  }
}
