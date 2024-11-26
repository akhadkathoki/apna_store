// import 'dart:ffi';

class Product {
  final String product_id;
  final String name;
  final String category;
  final String subtitle;
  final String description;
  final double rating;
  final double actualPrice;
  final double discountPrice;
  final double discountPercentage;
  final String paymentOptions;
  final String shopOwner;
  final String location;
  final String highlights;
  final String imageUrl;

  Product({
    required this.product_id,
    required this.name,
    required this.category,
    required this.subtitle,
    required this.description,
    required this.rating,
    required this.actualPrice,
    required this.discountPrice,
    required this.discountPercentage,
    required this.paymentOptions,
    required this.shopOwner,
    required this.location,
    required this.highlights,
    required this.imageUrl,
  });

  // Convert Firestore data to Product instance
factory Product.fromMap(Map<String, dynamic> data, String product_id) {
  return Product(
    product_id: data['product_id'] ?? '',
    name: data['name'] ?? '',
    category: data['category'] ?? '',
    subtitle: data['subtitle'] ?? '',
    description: data['description'] ?? '',
    rating: double.tryParse(data['rating']?.toString() ?? '0') ?? 0.0,
    actualPrice: double.tryParse(data['actual_price']?.toString() ?? '0') ?? 0.0,
    discountPrice: double.tryParse(data['discount_price']?.toString() ?? '0') ?? 0.0,
    discountPercentage: double.tryParse(data['discount_percentage']?.toString() ?? '0') ?? 0.0,
    paymentOptions: data['payment_options'] ?? '',
    shopOwner: data['shop_owner'] ?? '',
    location: data['location'] ?? '',
    highlights: data['highlights'] ?? '',
    imageUrl: data['image_url'] ?? '',
  );
}


}
