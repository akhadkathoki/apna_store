import 'package:apna_store/Screens/add_to_cart_page.dart';
import 'package:apna_store/Screens/billing_page.dart';
import 'package:apna_store/admin/product_list.dart';
import 'package:apna_store/controller/product_controller.dart';
import 'package:apna_store/models/product.dart';
import 'package:apna_store/img_file.dart'; // Assuming you have this for your image file
import 'package:apna_store/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:random_string/random_string.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  int quantity = 1;
  final int index = Get.arguments; // Get the index passed
  final ProductController productController = Get.find<ProductController>();
  bool isFavorite = false; // To track if the product is marked as favorite

  @override
  void initState() {
    super.initState();
    checkIfFavorite(); // Check if the product is already in the favorites
  }

  // Function to check if the product is already in favorites
  Future<void> checkIfFavorite() async {
    var items = productController.productApi[index];
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('favorites')
          .where('product_id', isEqualTo: items.productId)
          .get();

      if (snapshot.docs.isNotEmpty) {
        setState(() {
          isFavorite = true;
        });
      }
    } catch (e) {
      print('Error checking if favorite: $e');
    }
  }

  // Function to toggle favorite status
  Future<void> toggleFavorite() async {
    var items = productController.productApi[index];
    try {
      if (isFavorite) {
        // Remove from favorites
        await FirebaseFirestore.instance
            .collection('favorites')
            .where('product_id', isEqualTo: items.productId)
            .get()
            .then((snapshot) {
          for (var doc in snapshot.docs) {
            doc.reference.delete();
          }
        });
      } else {
        // Add to favorites
        var favourate_id = randomNumeric(5);
        var favoriteData = {
          "favourate_id": favourate_id,
          "name": items.name,
          "category": items.category,
          "quantity": quantity,
          "actual_price": items.actualPrice,
          "discount_price": items.discountPrice,
          "discount_percentage": items.discountPercentage,
          "shop_owner": items.shopOwner,
          "location": items.location,
          "image_url": productImg,
        };
        await FirebaseFirestore.instance
            .collection('favorites')
            .add(favoriteData);
      }

      setState(() {
        isFavorite = !isFavorite;
      });
    } catch (e) {
      print('Error toggling favorite: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var items = productController.productApi[index];
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        children: [
          // Product image
          Image.asset(
            items.imageUrl,
            height: 350,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 16.0),

          // Product name and subtitle
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            items.name,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF4F2D19), // Custom theme color
                            ),
                          ),
                          const SizedBox(height: 4.0),
                        ],
                      ),
                      const Spacer(),
                      const Spacer(),
                      const Spacer(),
                      Expanded(
                        child: IconButton(
                          onPressed: toggleFavorite,
                          icon: Icon(
                            isFavorite
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            size: 30,
                            color: Color(0xFF4F2D19),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),

                // Price and discount information
                Row(
                  children: [
                    Text(
                      '\$${items.actualPrice}',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 95, 94, 94),
                          decoration: TextDecoration.lineThrough),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      '-${items.discountPercentage}% Off',
                      style: const TextStyle(
                          fontSize: 18,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    Text(
                      '\$${items.discountPrice}',
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4F2D19), // Custom theme color
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 14,
          ),
          // Rating and Shop info
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber),
                        const SizedBox(width: 4.0),
                        Text(
                          '${items.rating}  Rating',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text(
                      'Seller: ${items.shopOwner}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),

                // Description
                Text(
                  items.description,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16.0),

                // Quantity increment/decrement section
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Quantity',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            setState(() {
                              if (quantity > 1) quantity--;
                            });
                          },
                          icon: const Icon(
                            Icons.remove_circle_outline,
                            color: Color(0xFF4F2D19),
                          ),
                        ),
                        Text(
                          '$quantity',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              quantity++;
                            });
                          },
                          icon: const Icon(Icons.add_circle_outline),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Highlights
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Highlights',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 3,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: items.highlights
                      .map<Widget>((highlight) => Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                const Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF4F2D19),
                                ),
                                const SizedBox(width: 8.0),
                                Text(highlight),
                              ],
                            ),
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16.0),

          // Payment options

          // Add to Cart & Buy Now Buttons
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 255, 221, 181),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {
                    // Add to cart functionality
                    Get.to(() => const AddToCartPage());
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 30),
                  ),
                  child: const Text('Add to Cart'),
                ),
                const SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    Get.to(() => BillingPage(),
                        arguments: {'index': index, 'quantity': quantity});
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                        vertical: 18, horizontal: 40),
                  ),
                  child: const Text('Buy Now'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
