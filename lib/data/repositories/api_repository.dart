import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../domain/models/models.dart';
import '../sources/api_client.dart';

Map<String, dynamic> _parseAndDecode(String response) =>
    jsonDecode(response) as Map<String, dynamic>;

Future<Map<String, dynamic>> parseJson(String text) =>
    compute(_parseAndDecode, text);

class ApiRepository {
  late final ApiClient _apiClient;

  ApiRepository() {
    final dio = Dio();
    dio.transformer = BackgroundTransformer()..jsonDecodeCallback = parseJson;
    _apiClient = ApiClient(dio);
  }

  Future<HotelModel> loadHotel() async {
    final hotelDto = await _apiClient.getHotel();
    final hotel = hotelDto.toDomain();
    return hotel;
  }

  Future<List<RoomModel>> loadRooms() async {
    final roomsDto = await _apiClient.getRooms();
    final rooms = roomsDto.rooms.map((roomDto) => roomDto.toDomain()).toList();
    return rooms;
  }

  Future<OrderModel> loadOrder() async {
    final orderDto = await _apiClient.getOrder();
    final order = orderDto.toDomain();
    return order;
  }
}
