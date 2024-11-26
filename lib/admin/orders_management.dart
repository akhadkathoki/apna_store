import 'package:apna_store/Screens/home_screen.dart';
import 'package:apna_store/controller/orderController.dart';
import 'package:apna_store/img_file.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrdersManagement extends StatelessWidget {
  const OrdersManagement({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Instantiate the controller
    final OrderController orderController = Get.put(OrderController());

    // Fetch orders on page load
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderController.fetchOrders();
    });

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.to(() => HomeScreen());
            },
            icon: Icon(Icons.home),
          ),
        ],
        title: const Text('Your Order'),
        backgroundColor: const Color(0xFF4F2D19),
      ),
      body: Obx(
        () {
          if (orderController.isLoading.value) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (orderController.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                orderController.errorMessage.value,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),
            );
          }

          if (orderController.orders.isEmpty) {
            return const Center(
              child: Text(
                'No orders available.',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(10),
            itemCount: orderController.orders.length,
            itemBuilder: (context, index) {
              var order = orderController.orders[index];
              return Container(
                margin: const EdgeInsets.only(bottom: 15),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(200, 255, 220, 164),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                padding: const EdgeInsets.all(15),
                height: 200,
                child: Row(
                  children: [
                    SizedBox(
                      height: 170,
                      width: screenWidth * 0.35,
                      child: Image.asset(
                        orderController.orders[index]["image_url"] ??
                            productImg, // Use image URL from Firebase or fallback
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Icon(Icons.broken_image, size: 50);
                        },
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            order['name'] ?? 'Unnamed Product',
                            style: TextStyle(
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            order['description'] ?? 'No description available',
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: const Color.fromARGB(212, 104, 104, 104),
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Seller: ${order['shop_owner'] ?? 'Unknown Seller'}',
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.bold,
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Text(
                              "${order['name']} is arriving on 16th Dec, 2024",
                              style: TextStyle(fontSize: screenWidth * 0.037),
                              softWrap: true,
                              textAlign: TextAlign.left,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
