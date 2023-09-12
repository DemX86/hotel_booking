class HotelModel {
  final int id;
  final String name;
  final String address;
  final double priceFrom;
  final String priceFromItem;
  final int rating;
  final String ratingName;
  final List<String> imageUrls;
  final String description;
  final List<String> peculiarities;

  HotelModel({
    required this.id,
    required this.name,
    required this.address,
    required this.priceFrom,
    required this.priceFromItem,
    required this.rating,
    required this.ratingName,
    required this.imageUrls,
    required this.description,
    required this.peculiarities,
  });
}
