class OrderModel {
  final int id;
  final String hotelName;
  final String hotelAddress;
  final int hotelRating;
  final String hotelRatingName;
  final String departure;
  final String arrival;
  final String tourDateStart;
  final String tourDateEnd;
  final int nightsCount;
  final String roomName;
  final String nutrition;
  final double tourPrice;
  final double fuelCharge;
  final double serviceCharge;

  OrderModel({
    required this.id,
    required this.hotelName,
    required this.hotelAddress,
    required this.hotelRating,
    required this.hotelRatingName,
    required this.departure,
    required this.arrival,
    required this.tourDateStart,
    required this.tourDateEnd,
    required this.nightsCount,
    required this.roomName,
    required this.nutrition,
    required this.tourPrice,
    required this.fuelCharge,
    required this.serviceCharge,
  });
}
