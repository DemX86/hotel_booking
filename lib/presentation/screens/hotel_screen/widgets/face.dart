import 'package:flutter/material.dart';

import '../../../../domain/models/hotel_model.dart';
import '../../../../utils/constants.dart';
import '../../../common/common.dart';

class Face extends StatelessWidget {
  final HotelModel hotel;

  const Face(this.hotel, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
        color: Colors.white,
      ),
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Carousel(imageUrls: hotel.imageUrls),
          const SizedBox(height: 8),
          HotelHeader(
            hotelRating: hotel.rating,
            hotelRatingName: hotel.ratingName,
            hotelName: hotel.name,
            hotelAddress: hotel.address,
            onAddressTap: () {},
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('от ${numberFormat.format(hotel.priceFrom.round())} ₽',
                  style: Styles.price),
              const SizedBox(width: 8),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 7),
                  child: Text(
                    hotel.priceFromItem.toLowerCase(),
                    style: Styles.bodyGrey,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
