class ProductModel {
  final String id;
  final String name;
  final String category;
  final double price;
  final double? originalPrice;
  final double rating;
  final int reviewCount;
  final String image;
  final String description;
  final bool isFavorite;
  final bool useTallImage;

  const ProductModel({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    this.originalPrice,
    required this.rating,
    required this.reviewCount,
    required this.image,
    required this.description,
    this.isFavorite = false,
    this.useTallImage = false,
  });
}
