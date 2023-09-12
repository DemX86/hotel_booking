import 'package:flutter/material.dart';

import 'common.dart';

class HotelHeader extends StatelessWidget {
  final int hotelRating;
  final String hotelRatingName;
  final String hotelName;
  final String hotelAddress;
  final void Function() onAddressTap;

  const HotelHeader({
    super.key,
    required this.hotelRating,
    required this.hotelRatingName,
    required this.hotelName,
    required this.hotelAddress,
    required this.onAddressTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HotelRating(
          rating: hotelRating,
          ratingName: hotelRatingName,
        ),
        const SizedBox(height: 8),
        Text(hotelName, style: Styles.title),
        const SizedBox(height: 8),
        Material(
          child: InkWell(
            onTap: onAddressTap,
            child: Text(hotelAddress, style: Styles.address),
          ),
        ),
      ],
    );
  }
}

class HotelRating extends StatelessWidget {
  final int rating;
  final String ratingName;

  const HotelRating({
    super.key,
    required this.rating,
    required this.ratingName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: const Color.fromRGBO(255, 199, 0, 0.2),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/star.png',
            width: 15,
            height: 15,
          ),
          Text('$rating $ratingName', style: Styles.rating),
        ],
      ),
    );
  }
}
