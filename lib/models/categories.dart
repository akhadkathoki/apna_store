// ignore_for_file: public_member_api_docs, sort_constructors_first

class CategoryModel {
  static final productItrem = [
    Item(
        id: 0,
        name: "Plastic Storage Bin",
        subtitle: "Large storage bin",
        description:
            "A versatile and durable storage bin made from high-quality plastic.",
        rating: 4.5,
        actualPrice: 25.0,
        discountPrice: 22.5,
        discountPercentage: 10,
        paymentOptions: ["Credit Card", "PayPal", "COD"],
        shopOwner: "HomeStorage",
        location: "Los Angeles, USA",
        highlights: [
          "Stackable design",
          "Durable construction",
          "Easy to clean"
        ])
  ];
}

class Item {
  final int id;
  final String name;
  final String subtitle;
  final String description;
  final num rating;
  final num actualPrice;
  final num discountPrice;
  final num discountPercentage;
  final List paymentOptions;
  final String shopOwner;
  final String location;
  final List highlights;
  Item({
    required this.id,
    required this.name,
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
  });
}
