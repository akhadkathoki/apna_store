import 'package:apna_store/Screens/payment_splash_screen.dart';
import 'package:apna_store/Utils/utils.dart';
import 'package:apna_store/controller/product_controller.dart';
import 'package:apna_store/img_file.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:random_string/random_string.dart';

class BillingPage extends StatefulWidget {
  const BillingPage({Key? key}) : super(key: key);

  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  final ProductController productController = Get.find<ProductController>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    // Retrieve arguments safely
    final arguments = Get.arguments as Map<String, dynamic>? ?? {};
    if (arguments.isEmpty) {
      return Scaffold(
        body: const Center(
          child: Text('No product data available!'),
        ),
      );
    }

    final index = arguments['index'] ?? 0;
    final quantity = arguments['quantity'] ?? 1;
    final items = productController.productApi[index];
    final totalBill = items.discountPrice * quantity;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Product Image
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  items.imageUrl, // Assuming `image` exists in productApi
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Product Name
            Text(
              items.name,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),

            // Product Ratings
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 20),
                Text(
                  '${items.rating} / 5', // Assuming `ratings` exists in productApi
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Product Price
            Text(
              'Price (each): \$${items.discountPrice}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Quantity
            Text(
              'Quantity: $quantity',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),

            // Total Bill
            Text(
              'Total Bill: \$${items.discountPrice * quantity}',
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            const SizedBox(height: 20),

            const Spacer(),

            // Loading or Proceed to Payment Button
            isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ElevatedButton(
                    onPressed: () async {
                      try {
                        setState(() {
                          isLoading = true;
                        });

                        // Simulate payment process
                        await Future.delayed(const Duration(seconds: 2));

                        if (!mounted) return;

                        // Save order details to Firestore
                        var order_id = randomNumeric(5);
                        final orderData = {
                          "order_id": order_id,
                          "name": items.name,
                          "category": items.category,
                          'quantity': quantity,
                          "subtitle": items.actualPrice,
                          "description": items.description,
                          "rating": items.rating,
                          "actual_price": items.actualPrice,
                          "discount_price": items.discountPrice,
                          "discount_percentage": items.discountPercentage,
                          "shop_owner": items.shopOwner,
                          "location": items.location,
                          "image_url": productImg
                        };

                        await FirebaseFirestore.instance
                            .collection('orders')
                            .add(orderData);

                        // Simulate payment process (add your logic here)
                        await Future.delayed(const Duration(seconds: 2));

                        setState(() {
                          isLoading = false;
                        });

                        // Show success message and navigate to Payment Success screen
                        Get.snackbar(
                          'Payment Successful',
                          'Your order for $quantity ${items.name} of price \$${items.discountPrice * quantity} has been placed!',
                          backgroundColor: Colors.green,
                          colorText: Colors.white,
                        );
                        Get.to(
                          () => PaymentSuccessSplashScreen(),
                          arguments: {'index': index, 'quantity': quantity},
                        );
                      } catch (error) {
                        // Handle errors by displaying an error message to the user and logging the error
                        setState(() {
                          isLoading =
                              false; // Stop the loading indicator if there is an error
                        });

                        Utils().toasMessage(
                            'Error placing order: $error'); // Print the error for debugging

                        Get.snackbar(
                          'Order Failed',
                          'Something went wrong while placing the order. Please try again later.',
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4F2D19),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: const Center(
                      child: Text(
                        'Proceed to Payment',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
