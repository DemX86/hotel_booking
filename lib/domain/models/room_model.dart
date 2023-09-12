class RoomModel {
  final int id;
  final String name;
  final double price;
  final String priceFor;
  final List<String> peculiarities;
  final List<String> imageUrls;

  RoomModel({
    required this.id,
    required this.name,
    required this.price,
    required this.priceFor,
    required this.peculiarities,
    required this.imageUrls,
  });
}
