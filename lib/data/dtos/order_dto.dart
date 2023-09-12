import 'package:hotel_booking/domain/models/models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_dto.g.dart';

@JsonSerializable()
class OrderDto {
  final int id;

  @JsonKey(name: 'hotel_name')
  final String hotelName;

  @JsonKey(name: 'hotel_adress')
  final String hotelAddress;

  @JsonKey(name: 'horating')
  final int hotelRating;

  @JsonKey(name: 'rating_name')
  final String hotelRatingName;

  final String departure;

  @JsonKey(name: 'arrival_country')
  final String arrival;

  @JsonKey(name: 'tour_date_start')
  final String tourDateStart;

  @JsonKey(name: 'tour_date_stop')
  final String tourDateEnd;

  @JsonKey(name: 'number_of_nights')
  final int nightsCount;

  @JsonKey(name: 'room')
  final String roomName;

  final String nutrition;

  @JsonKey(name: 'tour_price')
  final int tourPrice;

  @JsonKey(name: 'fuel_charge')
  final int fuelCharge;

  @JsonKey(name: 'service_charge')
  final int serviceCharge;

  OrderDto({
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

  factory OrderDto.fromJson(Map<String, dynamic> json) =>
      _$OrderDtoFromJson(json);

  OrderModel toDomain() {
    return OrderModel(
      id: id,
      hotelName: hotelName,
      hotelAddress: hotelAddress,
      hotelRating: hotelRating,
      hotelRatingName: hotelRatingName,
      departure: departure,
      arrival: arrival,
      tourDateStart: tourDateStart,
      tourDateEnd: tourDateEnd,
      nightsCount: nightsCount,
      roomName: roomName,
      nutrition: nutrition,
      tourPrice: tourPrice.toDouble(),
      fuelCharge: fuelCharge.toDouble(),
      serviceCharge: serviceCharge.toDouble(),
    );
  }
}
