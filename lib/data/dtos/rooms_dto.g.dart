// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rooms_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomsDto _$RoomsDtoFromJson(Map<String, dynamic> json) => RoomsDto(
      rooms: (json['rooms'] as List<dynamic>)
          .map((e) => RoomDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoomsDtoToJson(RoomsDto instance) => <String, dynamic>{
      'rooms': instance.rooms,
    };

RoomDto _$RoomDtoFromJson(Map<String, dynamic> json) => RoomDto(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
      priceFor: json['price_per'] as String,
      peculiarities: (json['peculiarities'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      imageUrls: (json['image_urls'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomDtoToJson(RoomDto instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
      'price_per': instance.priceFor,
      'peculiarities': instance.peculiarities,
      'image_urls': instance.imageUrls,
    };
