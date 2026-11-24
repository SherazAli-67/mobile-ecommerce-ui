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

  ProductModel copyWith({
    String? id,
    String? name,
    String? category,
    double? price,
    double? originalPrice,
    double? rating,
    int? reviewCount,
    String? image,
    String? description,
    bool? isFavorite,
    bool? useTallImage,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      price: price ?? this.price,
      originalPrice: originalPrice ?? this.originalPrice,
      rating: rating ?? this.rating,
      reviewCount: reviewCount ?? this.reviewCount,
      image: image ?? this.image,
      description: description ?? this.description,
      isFavorite: isFavorite ?? this.isFavorite,
      useTallImage: useTallImage ?? this.useTallImage,
    );
  }
}
