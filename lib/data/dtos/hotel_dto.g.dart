// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelDto _$HotelDtoFromJson(Map<String, dynamic> json) => HotelDto(
      id: json['id'] as int,
      name: json['name'] as String,
      address: json['adress'] as String,
      priceFrom: json['minimal_price'] as int,
      priceFromFor: json['price_for_it'] as String,
      rating: json['rating'] as int,
      ratingName: json['rating_name'] as String,
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      about: HotelAboutDto.fromJson(
          json['about_the_hotel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelDtoToJson(HotelDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'adress': instance.address,
      'minimal_price': instance.priceFrom,
      'price_for_it': instance.priceFromFor,
      'rating': instance.rating,
      'rating_name': instance.ratingName,
      'image_urls': instance.imageUrls,
      'about_the_hotel': instance.about,
    };

HotelAboutDto _$HotelAboutDtoFromJson(Map<String, dynamic> json) =>
    HotelAboutDto(
      description: json['description'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$HotelAboutDtoToJson(HotelAboutDto instance) =>
    <String, dynamic>{
      'description': instance.description,
      'peculiarities': instance.peculiarities,
    };
