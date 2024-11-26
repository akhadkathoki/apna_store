// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

List<ProductApi> productFromJson(String str) =>
    List<ProductApi>.from(json.decode(str).map((x) => ProductApi.fromJson(x)));

String productToJson(List<ProductApi> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductApi {
  String productId;
  String name;
  String category;
  Subtitle subtitle;
  String description;
  String rating;
  String actualPrice;
  String discountPrice;
  String discountPercentage;
  PaymentOptions paymentOptions;
  String shopOwner;
  String location;
  List<String> highlights;
  String imageUrl;

  ProductApi({
    required this.productId,
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

  factory ProductApi.fromJson(Map<String, dynamic> json) => ProductApi(
        productId: json["product_id"],
        name: json["name"],
        category: json["category"],
        subtitle: subtitleValues.map[json["subtitle"]]!,
        description: json["description"],
        rating: json["rating"],
        actualPrice: json["actual_price"],
        discountPrice: json["discount_price"],
        discountPercentage: json["discount_percentage"],
        paymentOptions: paymentOptionsValues.map[json["payment_options"]]!,
        shopOwner: json["shop_owner"],
        location: json["location"],
        highlights: List<String>.from(json["highlights"].map((x) => x)),
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "product_id": productId,
        "name": name,
        "category": category,
        "subtitle": subtitleValues.reverse[subtitle],
        "description": description,
        "rating": rating,
        "actual_price": actualPrice,
        "discount_price": discountPrice,
        "discount_percentage": discountPercentage,
        "payment_options": paymentOptionsValues.reverse[paymentOptions],
        "shop_owner": shopOwner,
        "location": location,
        "highlights": List<dynamic>.from(highlights.map((x) => x)),
        "image_url": imageUrl,
      };
}

enum PaymentOptions { CASH_ON_DELIVERY, CREDIT_CARD, NET_BANKING, UPI }

final paymentOptionsValues = EnumValues({
  "Cash on Delivery": PaymentOptions.CASH_ON_DELIVERY,
  "Credit Card": PaymentOptions.CREDIT_CARD,
  "Net Banking": PaymentOptions.NET_BANKING,
  "UPI": PaymentOptions.UPI
});

enum Subtitle { CLASSIC, COMPACT, LUXURY, MODERN, RUSTIC }

final subtitleValues = EnumValues({
  "Classic": Subtitle.CLASSIC,
  "Compact": Subtitle.COMPACT,
  "Luxury": Subtitle.LUXURY,
  "Modern": Subtitle.MODERN,
  "Rustic": Subtitle.RUSTIC
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
