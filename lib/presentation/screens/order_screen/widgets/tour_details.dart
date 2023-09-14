import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../domain/models/models.dart';
import '../../../common/common.dart';

class TourDetails extends StatelessWidget {
  final OrderModel order;

  const TourDetails({super.key, required this.order});

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
        columnWidths: const {
          0: FixedColumnWidth(140),
          1: FlexColumnWidth(),
        },
        children: [
          TableRow(
            children: [
              Text(lc.tourDeparture, style: Styles.bodyGrey),
              Text(order.departure, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourArrival, style: Styles.bodyGrey),
              Text(order.arrival, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourDates, style: Styles.bodyGrey),
              Text(
                '${order.tourDateStart}−${order.tourDateEnd}',
                style: Styles.bodyBlack,
              ),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourNights, style: Styles.bodyGrey),
              Text(lc.tourNightsCount(order.nightsCount),
                  style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourHotel, style: Styles.bodyGrey),
              Text(order.hotelName, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourRoom, style: Styles.bodyGrey),
              Text(order.roomName, style: Styles.bodyBlack),
            ],
          ),
          rowSpacer,
          TableRow(
            children: [
              Text(lc.tourNutrition, style: Styles.bodyGrey),
              Text(order.nutrition, style: Styles.bodyBlack),
            ],
          ),
        ],
      ),
    );
  }
}
