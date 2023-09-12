import 'package:json_annotation/json_annotation.dart';

import '../../domain/models/hotel_model.dart';

part 'hotel_dto.g.dart';

@JsonSerializable()
class HotelDto {
  final int id;

  final String name;

  @JsonKey(name: 'adress')
  final String address;

  @JsonKey(name: 'minimal_price')
  final int priceFrom;

  @JsonKey(name: 'price_for_it')
  final String priceFromFor;

  final int rating;

  @JsonKey(name: 'rating_name')
  final String ratingName;

  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  @JsonKey(name: 'about_the_hotel')
  final HotelAboutDto about;

  HotelDto({
    required this.id,
    required this.name,
    required this.address,
    required this.priceFrom,
    required this.priceFromFor,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.about,
  });

  factory HotelDto.fromJson(Map<String, dynamic> json) =>
      _$HotelDtoFromJson(json);

  HotelModel toDomain() {
    return HotelModel(
      id: id,
      name: name,
      address: address,
      priceFrom: priceFrom.toDouble(),
      priceFromItem: priceFromFor,
      rating: rating,
      ratingName: ratingName,
      imageUrls: imageUrls,
      description: about.description,
      peculiarities: about.peculiarities,
    );
  }
}

@JsonSerializable()
class HotelAboutDto {
  final String description;
  final List<String> peculiarities;

  HotelAboutDto({
    required this.description,
    required this.peculiarities,
  });

  factory HotelAboutDto.fromJson(Map<String, dynamic> json) =>
      _$HotelAboutDtoFromJson(json);
}
