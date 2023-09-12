import 'package:hotel_booking/domain/models/room_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'rooms_dto.g.dart';

@JsonSerializable()
class RoomsDto {
  final List<RoomDto> rooms;

  RoomsDto({required this.rooms});

  factory RoomsDto.fromJson(Map<String, dynamic> json) =>
      _$RoomsDtoFromJson(json);
}

@JsonSerializable()
class RoomDto {
  final int id;

  final String name;

  final int price;

  @JsonKey(name: 'price_per')
  final String priceFor;

  final List<String> peculiarities;

  @JsonKey(name: 'image_urls')
  final List<String> imageUrls;

  RoomDto({
    required this.id,
    required this.name,
    required this.price,
    required this.priceFor,
    required this.peculiarities,
    required this.imageUrls,
  });

  factory RoomDto.fromJson(Map<String, dynamic> json) =>
      _$RoomDtoFromJson(json);

  RoomModel toDomain() {
    return RoomModel(
      id: id,
      name: name,
      price: price.toDouble(),
      priceFor: priceFor,
      peculiarities: peculiarities,
      imageUrls: imageUrls,
    );
  }
}
