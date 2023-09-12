// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => OrderDto(
      id: json['id'] as int,
      hotelName: json['hotel_name'] as String,
      hotelAddress: json['hotel_adress'] as String,
      hotelRating: json['horating'] as int,
      hotelRatingName: json['rating_name'] as String,
      departure: json['departure'] as String,
      arrival: json['arrival_country'] as String,
      tourDateStart: json['tour_date_start'] as String,
      tourDateEnd: json['tour_date_stop'] as String,
      nightsCount: json['number_of_nights'] as int,
      roomName: json['room'] as String,
      nutrition: json['nutrition'] as String,
      tourPrice: json['tour_price'] as int,
      fuelCharge: json['fuel_charge'] as int,
      serviceCharge: json['service_charge'] as int,
    );

Map<String, dynamic> _$OrderDtoToJson(OrderDto instance) => <String, dynamic>{
      'id': instance.id,
      'hotel_name': instance.hotelName,
      'hotel_adress': instance.hotelAddress,
      'horating': instance.hotelRating,
      'rating_name': instance.hotelRatingName,
      'departure': instance.departure,
      'arrival_country': instance.arrival,
      'tour_date_start': instance.tourDateStart,
      'tour_date_stop': instance.tourDateEnd,
      'number_of_nights': instance.nightsCount,
      'room': instance.roomName,
      'nutrition': instance.nutrition,
      'tour_price': instance.tourPrice,
      'fuel_charge': instance.fuelCharge,
      'service_charge': instance.serviceCharge,
    };
