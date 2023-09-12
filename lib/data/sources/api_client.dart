import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../dtos/dtos.dart';

part 'api_client.g.dart';

class Api {
  static const baseUrl = 'https://run.mocky.io/v3/';
  static const hotel = '35e0d18e-2521-4f1b-a575-f0fe366f66e3';
  static const room = 'f9a38183-6f95-43aa-853a-9c83cbb05ecd';
  static const order = 'e8868481-743f-4eb2-a0d7-2bc4012275c8';
}

@RestApi(baseUrl: Api.baseUrl)
abstract class ApiClient {
  factory ApiClient(Dio dio) = _ApiClient;

  @GET(Api.hotel)
  Future<HotelDto> getHotel();

  @GET(Api.room)
  Future<RoomsDto> getRooms();

  @GET(Api.order)
  Future<OrderDto> getOrder();
}
