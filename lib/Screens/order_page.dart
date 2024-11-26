import 'package:apna_store/Screens/home_screen.dart';
import 'package:apna_store/controller/orderController.dart';
import 'package:apna_store/img_file.dart';
import 'package:apna_store/models/categories.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Instantiate the controller and fetch orders
    final OrderController orderController = Get.put(OrderController());
    orderController.fetchOrders(); // Fetch orders on page load

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
          if (orderController.orders.isEmpty) {
            return Center(
                child:
                    CircularProgressIndicator()); // Show loading while fetching data
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
                      width: screenWidth *
                          0.35, // Image size adapts to screen width
                      child: Image.asset (
                        productImg, // Use the actual image URL from Firebase
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            order['name'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.05, // Adapt font size
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            order['description'],
                            style: TextStyle(
                              fontSize: screenWidth * 0.035,
                              color: const Color.fromARGB(212, 104, 104, 104),
                            ),
                            softWrap: true,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Seller: ${order['shop_owner']}',
                            textAlign: TextAlign.right,
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontWeight: FontWeight.bold),
                            softWrap: true,
                          ),
                          const SizedBox(height: 5),
                          Expanded(
                            child: Text(
                              "${order['name']}  is arriving on 16th Dec, 2024" ??
                                  'N/A',
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

  // Modify this method to receive the product data from Firebase
}
