import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class OrderController extends GetxController {
  var orders = <Map<String, dynamic>>[].obs; // List to store orders

  // Fetch orders from Firebase
  void fetchOrders() async {
    try {
      var snapshot = await FirebaseFirestore.instance.collection('orders').get();
      var orderList = snapshot.docs.map((doc) => doc.data()).toList();
      orders.assignAll(orderList); // Update the orders list
    } catch (e) {
      print("Error fetching orders: $e");
    }
  }
}
